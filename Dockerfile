FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install apt-utils

RUN apt-get install postgresql
ADD ./pga_hba.conf /etc/postgresql/9.4/main/pga_hba.conf
RUN cat /etc/postgresql/9.4/main/postgresql.conf
