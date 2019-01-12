# Intro to Docker

## Pulling and running an existing image

Pull a public image such as ubuntu or centos using the docker pull command.  If a tag is not specified, docker will default to "latest".

```bash
$ docker pull ubuntu:14.04
```

Now run the image using the docker run command.  Use the "-it" option to get an interactive terminal during the run.

```bash
$ docker run -it ubuntu:14.04
$ whoami
$ lsb_release -a
```

## Creating and building a Dockerfile

While manually modifying and commiting changes is one way to build images, using a Dockerfile provides a way to build images so that others can understand how the image was constructed and make modifications.

A Dockerfile has many options.  We will focus on a few basic ones (FROM, MAINTAINER, ADD, and RUN)

Start by making an empty directory.

```
mkdir mydockerimage
```

Create a simple shell script called `script` in your local directory using your favorite editor.

```
#!/bin/bash
echo "Hello World! -- Me"
```

Now create a file called `Dockerfile` in the same directory like the following.  Use your own name and e-mail for the maintainer label.

```
FROM ubuntu:14.04
LABEL maintainer="patsmith"

ADD ./script /bin/script
RUN mv /bin/script /bin/hello && chmod a+rx /bin/hello
```

Now build the image using the docker build command.  Be sure to use the `-t` option to tag it.  Tell the Dockerfile to build using the current directory by specifying `.`.  Alternatively you could place the Dockerfile and script in an alternate location and specify that directory in the docker build command.

```bash
docker build -t hello:1.0 .
```

Try running the image.

```bash
docker run -it hello:1.0
hello
```

## Pushing a Dockerfile to dockerhub

Docker provides a public hub that can be use to store and share images.  Before pushing an image, you will need to create an account at Dockerhub.  Go to [https://cloud.docker.com/](https://cloud.docker.com/) to create the account.  Once the account is created, push your test image using the docker push command.  In this example, we will assume the username is patsmith.  If you haven't done a `docker login` you may need to do that first.

```bash
docker tag hello:1.0 patsmith/hello:1.0
docker login
docker push patsmith/hello:1.0
```

The first push make take some time depending on your network connection and the size of the image.

## Hands on Activity: MPI hello world

Now that you've practiced loading a simple script, try creating an image that can run this short MPI hello word code:

```code
// Hello World MPI app
#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    int size, rank;
    char buffer[1024];

    MPI_Init(&argc, &argv);

    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    gethostname(buffer, 1024);

    printf("hello from %d of %d on %s\n", rank, size, buffer);

    MPI_Barrier(MPI_COMM_WORLD);

    MPI_Finalize();
    return 0;
}
```
Hints: 
* You can start with the image "nersc/ubuntu-mpi:14.04". It already has MPI installed.
* You compile with "mpicc helloworld.c -o /app/hello"

<details>
  <summary>Expand to see the answer</summary>
  <p>

Dockerfile:
```bash
# MPI Dockerfile
FROM nersc/ubuntu-mpi:14.04

ADD helloworld.c /app/

RUN cd /app && mpicc helloworld.c -o /app/hello
```

docker build -t mydockerid/hellompi:latest .

docker push mydockerid/hellompi:latest

Log into the image and run the app:

docker run -it mydockerid/hellompi:latest

root@982d980864e5:/# mpirun -n 10 /app/hello
hello from 3 of 10 on 982d980864e5

hello from 4 of 10 on 982d980864e5

hello from 7 of 10 on 982d980864e5

hello from 9 of 10 on 982d980864e5

hello from 2 of 10 on 982d980864e5

hello from 5 of 10 on 982d980864e5

hello from 8 of 10 on 982d980864e5

hello from 0 of 10 on 982d980864e5

hello from 6 of 10 on 982d980864e5

hello from 1 of 10 on 982d980864e5

</p></details>

