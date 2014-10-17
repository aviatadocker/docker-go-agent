# Dockerfile for ThoughtWorks Go Agent (http://www.go.cd)
#
# http://github.com/patforna/docker/go-agent

FROM customercentrix/java8

# http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb
# http://download.go.cd/gocd/go-agent-14.2.0-377.zip

RUN wget -O /tmp/go-agent.deb http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb \
  && dpkg -i /tmp/go-agent.deb \
  && rm -f /tmp/go-agent.deb \
  # get rid of GO_SERVER AND GO_SERVER_PORT defaults. We'll use env variables.
  && sed -i '/.*GO_SERVER.*/d' /etc/default/go-agent \
  # make sure container doesn't exit after starting agent
  && sed -i 's/DAEMON=Y/DAEMON=N/' /etc/default/go-agent \
  # make sure that init.d script passes through environment variables
  && sed -i 's/su -/su -p/' /etc/init.d/go-agent

# set GO_SERVER env variable to go-server (defined in /etc/hosts)
ENV GO_SERVER go-server

CMD su go -c '/etc/init.d/go-agent start'
