FROM customercentrix/java8

# http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb
# http://download.go.cd/gocd/go-agent-14.2.0-377.zip

RUN apt-get update \
  && apt-get upgrade \
  && apt-get install mysql-client-5.6 \
  && wget -O /tmp/go-agent.deb http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb \
  && dpkg -i /tmp/go-agent.deb \
  && rm -f /tmp/go-agent.deb \
  && sed -i '/.*GO_SERVER.*/d' /etc/default/go-agent \
  && sed -i '/.*GO_SERVER_PORT.*/d' /etc/default/go-agent \
  && sed -i 's/DAEMON=Y/DAEMON=N/' /etc/default/go-agent \
  && sed -i 's/su -/su -p/' /etc/init.d/go-agent

CMD su go -c '/etc/init.d/go-agent start'
