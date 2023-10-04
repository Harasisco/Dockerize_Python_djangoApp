# Dockerize_Python_DjangoApp

<p>Welcome to the Dockerize Python Django App repository! In this project, we'll guide you through the process of containerizing a Django web App application using Docker. Docker makes it easy to package your application and its dependencies into a single, portable container that can run consistently across different environments. </p>

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Clone the Repository](#clone-the-repository)
  - [Build the Docker Image](#build-the-docker-image)
  - [Run the Docker Container](#run-the-docker-container)
- [Accessing the Application](#accessing-the-application)
- [Customization](#customization)

## Prerequisites

Like the previous project [Dockerizing_Node.js](https://github.com/Harasisco/Dockerizing_Node.js) , make sure you have the following prerequisites installed on your local machine:

- [Docker](https://www.docker.com/get-started)
- Git (for cloning the repository)

## Getting Started

Follow these steps to build and run the Django web app using Docker on your local machine.

### Clone the Repository

If you haven't already clone this repository to your local machine using Git then folow this two instractions:

```bash
git clone https://github.com/Harasisco/Dockerize_Python_djangoApp.git
cd Dockerize_Python_djangoApp
```

### Build the Docker Image

To build the Docker image for the Django web app, run the following command in the project directory:

```bash
docker build . -t <your username>/python-django-app
```

This command will create a Docker image named ``` <your username>/python-django-app ```.

Check the image using:

```bash
docker images
```

### Run the Docker Container

Now that you have built the Docker image, you can run the Django web app in a Docker container. Use the following command:

```bash
docker run -p 49160:8000 -d <your username>/python-django-app
```

This command will start a Docker container in detached mode, exposing port 8000 of the container to port 49160 on your local machine.

## Accessing the Application

Once the Docker container is running, you can access the Django web app in your web browser by navigating to http://localhost:49160.

Or you can call your app using ``` curl ``` (install if needed via: ``` sudo apt-get install curl ``` ):

```bash
curl -i localhost:49160
```
## Customization

Feel free to customize the Django web app and the Docker configuration to suit your needs. You can modify the HTML view in the ``` Dockerize_Python_djangoApp/mysite/hello_world/templates/hello_world.html ``` file.
