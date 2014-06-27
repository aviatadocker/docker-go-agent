# Running containers

To run one or more agents, repeat the following command to launch as many as you need:

    docker run -d --link go-server:go-server patforna/go-agent    

# Building image from scratch

The following commands build the images from scratch and tag it accordingly (replace 14.1.0 with new version).

    docker build -t patforna/go-agent:14.1.0 go-agent && \
    docker tag patforna/go-agent:14.1.0 patforna/go-agent:latest