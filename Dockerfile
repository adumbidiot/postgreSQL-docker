FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install apt-utils

RUN apt-get install postgresql

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf
ADD ./postgresql.conf /etc/postgresql/9.4/main/postgresql.conf

#USER postgres
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker
    
EXPOSE 5432

VOLUME /var/database
RUN sed -ie 's@data_directory = '/var/lib/postgresql/9.4/main'@admin@g' /etc/postgresql/9.4/main/postgresql.conf
RUN cat /etc/postgresql/9.4/main/postgresql.conf
CMD /usr/lib/postgresql/9.4/bin/postgres -c config_file=/etc/postgresql/9.4/main/postgresql.conf
# -D /var/lib/postgresql/9.4/main
