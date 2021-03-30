#!/bin/bash
# HTTP/HTTPS
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
# DNS
firewall-cmd --permanent --add-port=53/tcp
firewall-cmd --permanent --add-port=53/udp
# LDAP/LDAPS
firewall-cmd --permanent --add-port=389/tcp
firewall-cmd --permanent --add-port=636/tcp
# Kerberos TCP
firewall-cmd --permanent --add-port=88/tcp
firewall-cmd --permanent --add-port=464/tcp
# Kerberos UDP
firewall-cmd --permanent --add-port=88/udp
firewall-cmd --permanent --add-port=464/udp
#  NTP
firewall-cmd --permanent --add-port=123/udp
firewall-cmd --reload