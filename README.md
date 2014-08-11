# Dockerized go agent

This repository contains a Dockerfile for containerizing [Go](http://go.cd) build agents.

## Usage

Repeat the following command to launch as many agents as you need:

    docker run -d --link go-server:go-server patforna/go-agent

## Building from scratch

    docker build -t patforna/go-agent .
