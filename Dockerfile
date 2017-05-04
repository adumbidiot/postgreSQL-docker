FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install aptutils

RUN apt-get install postgresql
