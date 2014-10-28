FROM customercentrix/java8

# Thoughtworks Go 14.2 Agent

RUN  date -u +"%Y-%m-%d %H:%M:%S" && apt-get update \
  && date -u +"%Y-%m-%d %H:%M:%S" && apt-get -y upgrade \
  && date -u +"%Y-%m-%d %H:%M:%S" && apt-get -y install mysql-client-5.6 ant ivy \
  && date -u +"%Y-%m-%d %H:%M:%S" && wget -O /usr/share/ant/lib/jsch-0.1.51.jar http://central.maven.org/maven2/com/jcraft/jsch/0.1.51/jsch-0.1.51.jar \
  && date -u +"%Y-%m-%d %H:%M:%S" && wget -O /tmp/go-agent.deb http://download.go.cd/gocd-deb/go-agent-14.2.0-377.deb \
  && date -u +"%Y-%m-%d %H:%M:%S" && dpkg -i /tmp/go-agent.deb \
  && date -u +"%Y-%m-%d %H:%M:%S" && rm -f /tmp/go-agent.deb \
  && date -u +"%Y-%m-%d %H:%M:%S" && sed -i '/.*GO_SERVER.*/d' /etc/default/go-agent \
  && date -u +"%Y-%m-%d %H:%M:%S" && sed -i '/.*GO_SERVER_PORT.*/d' /etc/default/go-agent \
  && date -u +"%Y-%m-%d %H:%M:%S" && sed -i 's/DAEMON=Y/DAEMON=N/' /etc/default/go-agent \
  && date -u +"%Y-%m-%d %H:%M:%S" && sed -i 's/su -/su -p/' /etc/init.d/go-agent \
  && date -u +"%Y-%m-%d %H:%M:%S"

CMD su go -c '/etc/init.d/go-agent start'
