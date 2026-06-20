FROM python:3.12-slim

WORKDIR /app

COPY app/ .

EXPOSE 8000

CMD ["python", "main.py"]

# CMD ["python", "-m", "http.server", "8000", "-b", "0.0.0.0"]


# write instructions for writing. 
# base image is our starting point
# unsure what base image to use?
# FROM python:3.12-slim

# get the dependencies
# download dependencies first then run the rest of the code to take advantage of caching

# layer caching for dependencies: This is important because it allows us to avoid re-downloading dependencies every time we make a change to our code. By copying only the files that are necessary for installing dependencies (like package.json and package-lock.json for Node.js projects) before copying the rest of the application code, we can take advantage of Docker's layer caching. This means that if we haven't changed our dependencies, Docker will use the cached layer for installing them, which speeds up the build process significantly.
# If one layer changes, all layers will be rebuilt that come after it. 
# layer changed -> do it again (rebuild)
# layer did not change -> use cache


# COPY the requirements file to the working directory

# COPY requirements.txt .

# move to the working directory
# WORKDIR /app

# install the dependencies
# RUN pip install -r requirements.txt


# COPY the rest of the code to the working directory
# COPY . .

# since we are copying everything, we need way to ignore, use a .dockerignore file to ignore files and directories that are not needed in the container (like node_modules, .git, etc.)

# TO SET ENV VARIABLES do ENV VARIABLE_NAME=value
# USE expose if the application is running on a specific port, this is for documentation purposes and does not actually publish the port. To publish the port, we need to use the -p flag when running the container.

# ex: EXPOSE 3000


# running the application, this is the command that will be executed when the container starts. This should be the command to start your application.
# we use CMD and not RUN because CMD is used to specify the command that will be executed when the container starts, while RUN is used to execute commands during the build process. If we use RUN, the command will be executed during the build process and not when the container starts.
# CMD ["python"]




# port forwarding: bridge  example 9000:9000. The one on the left is the host port and the one on the right is the container port. This means that when we access localhost:9000 on our host machine, it will be forwarded to port 9000 in the container. This is useful for accessing applications running inside the container from our host machine.


