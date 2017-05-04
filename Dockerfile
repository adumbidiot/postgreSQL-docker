FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install apt-utils

RUN apt-get install postgresql
ADD ./pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf
RUN cat /etc/postgresql/9.4/main/postgresql.conf
