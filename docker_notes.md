
Docker basically: "Hey its not working", "it works on my machine though". 
Docker is a developer tool that helps you develop, build and ship and run applications in lightweight containers. 

IMPORTANT: Docker makes development faster and easier. It packages our code, code dependencies, environment setting, and everything else. This package can be given to anyone else and it works. It makes runnning your code on any computer easier. No longer have to install a bunch of bs, docker takes care of it all for you (i think)


How docker works

Images: Recipe. It continas  all the instructions and ingredients. A docker image has the technology we need, runtimes, and the tools/instructions we need to run the code. 

Containers: What is made from the recipe. From one image we can make multiple container(this is how we run the code)


DOCKER FILE: This is our reciper (the image i believe. )


docker scout for finding vulnerabilities. 


if we wanted to add backend, db, etc, we can make one big container. Not ideal
we separate services, and build a multi container application. 
Now we have multiple containers, we need way to connect them and run them. 
Docker Compose: Tells all container how to work together to build the full application. 

Create compose.yaml file. 

when we close container, we lost state and data. if we want container to share data between each other, we make volume. 
Volume is just a folder on our computer that docker access to save data any data from our containers and be able to share with other containers. 

docker compose, docker volume
docker cloud: faster builds

docker init: does everything u need