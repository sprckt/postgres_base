FROM postgres:latest

#pgcli as life is too short - https://www.pgcli.com/
RUN apt-get update && apt-get install -y \
    libpq-dev python-dev python3-pip; \
    rm -rf /var/lib/apt/lists/*; pip3 install pgcli

EXPOSE 5432
CMD ["postgres"]