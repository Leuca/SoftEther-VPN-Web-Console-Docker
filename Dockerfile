FROM debian:latest
MAINTAINER luca@luco.cc
RUN apt update
RUN apt upgrade -y
RUN apt -y install cmake gcc g++ libncurses5-dev libreadline-dev libssl-dev make zlib1g-dev
WORKDIR /home
ADD SoftEtherVPN_Stable/ .
ADD SEVPN-WebAdmin/ .
RUN cp -r wwwroot src/bin/hamcore/
RUN ./configure
RUN make
RUN make install
WORKDIR /
RUN rm -rf /home
ADD vpn.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/vpn.sh
ENTRYPOINT ["/usr/local/bin/vpn.sh"]
EXPOSE 1194/udp
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 5555/tcp
