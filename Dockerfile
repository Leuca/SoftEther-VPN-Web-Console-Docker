FROM centos:stream9
LABEL org.opencontainers.image.authors="luca@magrone.cc"
RUN dnf update -y
RUN dnf install dnf-plugins-core -y
RUN dnf copr enable lucamagrone/SoftEtherVPN-Console -y
RUN dnf install softethervpn-server -y
ADD vpn.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/vpn.sh
ENTRYPOINT ["/usr/local/bin/vpn.sh"]
EXPOSE 1194/udp
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 5555/tcp
