# Day 01 - Docker Basics

Today I learned the basics of Docker and Python's `http.server` module.

I began by learning how to use `http.server` which is a python module that allows us to quickly run a web server on our machine. I was able to start a simple server with:

```bash
python -m http.server 8000
```

This served files from the current directory and helped me understand how web servers, ports, and HTTP requests work.I will need to review this in more detail however.  
While this was useful, it only served static files. To add interactivity and persistent storage, I created my own Python script using `BaseHTTPRequestHandler` and `HTTPServer`.

What my custom server did was generates a random number on every request, stores it in a file, reads the file contents, and returns the results to the browser. Building this helped me a little   understand the request-response lifecycle of a web server.

On the Docker side, I learned the difference between an image and a container. An image is a blueprint or recipe that contains everything needed to run an app while a  container is a running instance of that image.


So far I learned how to:
* Write a Dockerfile
* Build Docker image
* Run containers (docker run....)
* Map ports between the host and container (`80:8000`). (I believe this is called port forwarding)
* Access a containerized application from another machine on the same LAN. I did this by getting my ip address and typing it on to the other machine. I believe since it defaults to port 80, there was no reason to specify it. 
* Create and use Docker volumes
* Push and pull images from Docker Hub (this Is still new, so I will need to review more)

By using a Docker volume, I was able to persist data across container restarts and even after pulling the image again from Docker Hub. This was however still pretty challenging to get up and running. 

Overall, this project gave me a intro to  networking, containerization, and persistent storage.
