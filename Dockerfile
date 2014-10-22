FROM customercentrix/java8

# http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb
# http://download.go.cd/gocd/go-agent-14.2.0-377.zip

RUN date \
  && apt-get update \
  && date \
  && apt-get -y upgrade \
  && date \
  && apt-get -y install mysql-client-5.6 ant ivy \
  && date \
  && wget -O /tmp/go-agent.deb http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb \
  && date \
  && dpkg -i /tmp/go-agent.deb \
  && date \
  && rm -f /tmp/go-agent.deb \
  && date \
  && sed -i '/.*GO_SERVER.*/d' /etc/default/go-agent \
  && date \
  && sed -i '/.*GO_SERVER_PORT.*/d' /etc/default/go-agent \
  && date \
  && sed -i 's/DAEMON=Y/DAEMON=N/' /etc/default/go-agent \
  && date \
  && sed -i 's/su -/su -p/' /etc/init.d/go-agent \
  && date 

CMD su go -c '/etc/init.d/go-agent start'
