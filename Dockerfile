FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install apt-utils

RUN apt-get install postgresql
RUN ls /etc/postgresql/9.4/main/
