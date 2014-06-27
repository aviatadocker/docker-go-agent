# Dockerized go agent

This repository contains a Dockerfile for containerizing [Go](http://go.cd) build agents.

# Usage

To run one or more agents, repeat the following command to launch as many as you need:

    docker run -d --link go-server:go-server patforna/go-agent    

# Building from scratch

To build the image from scratch, execute the command below (replace 14.1.0 with new version):

    docker build -t patforna/go-agent:14.1.0 .