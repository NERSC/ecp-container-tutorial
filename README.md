# Container Computing for HPC and Scientific Workflows - ECP Tutorial

Container computing is revolutionizing the way applications are developed and delivered. It offers opportunities that never existed before for significantly improving efficiency of scientific workflows and easily moving these workflows from the laptop to the supercomputer. Tools like Docker, Shifter, Singularity and Charliecloud enable a new paradigm for scientific and technical computing. However, to fully unlock its potential, users and administrators need to understand how to utilize these new approaches. This tutorial will introduce attendees to the basics of creating container images, explain best practices, and cover more advanced topics such as creating images to be run on HPC platforms using three HPC Container runtimes. The tutorial will also explain how research scientists can utilize container-based computing to accelerate their research and how these tools can boost the impact of their research by enabling better reproducibility and sharing of their scientific process without compromising security.  

The content for the handouts will be posted and updated at [https://github.com/nersc/ecp-container-tutorial](https://github.com/nersc/ecp-container-tutorial).

## Prerequisites

This is hands-on tutorial. Participants should bring a laptop and pre-install Docker in advance to make the best use of time during the tutorial (see the [Setup](setup.md) section for details). Users can also create a docker account in advance at [https://cloud.docker.com/](https://cloud.docker.com/). This account will be needed to create images on docker cloud and dockerhub. In addition, users should install an ssh client for their operating system so they can access the HPC resources we will use for the Shifter portion of the tutorials.

For more detailed instructions, see [Setup](setup.md).

## Slides

Slides can be found in the following [Google Drive Folder](https://drive.google.com/open?id=17ibGRs7HAZ8AOnLQUo1CTNFgShB-6Nph).


## Communication
Please raise your hand if you need assistance. You can also ask questions on this [Google Doc](https://docs.google.com/document/d/1thz5sp7upnhy5PKi6SpS-C9NuGRHoY5lz0NSJy7_mJM/edit?usp=sharing).

## Feedback
Please add comments to the Google Doc about this tutorial at the end of the session.

## Agenda

- 14:00: [Welcome and Intro to Containers](00-intro.md)
    - Intro to Containers
- 14:30 - [First hands-on](01-hands-on.md)
- 15:30: Break
    - Distribute NERSC logins. **Please obtain a NERSC login from tutorial staff during the break**

- 15:45: Container runtimes and HPC
    - Overview of HPC runtimes (Shifter, Singularity and Charliecloud
    - [Shifter](02-shifter.md)
- 16:00: Second hands-on - HPC Runtimes and SDK
    - [Shifter at NERSC](03-hands-on.md)
    - Charliecloud - Tim
    - Singularity Examples - Sameer
    - ECP SDK Demo - Sameer
- 17:00: Optimizations, Advanced Use Cases and User Success Stories
    - [Optimizing Images](04-optimizing.md)
    - Considerations for running on GPUs and non-x86 Architectures - Adam Carlyle
    - [Science Use Cases](05-use-cases.md)
- 17:30: [Wrap-Up](06-wrap-up.md)
