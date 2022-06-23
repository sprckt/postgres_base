FROM python:3.8.5

# Update and install system packages
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev python-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install DBT
RUN pip install -U pip
RUN pip install dbt==0.18.1 \
    invoke \
    sqlfluff

COPY transforms/profiles.yml /dbt/profiles.yml
# Set working directory
WORKDIR /app

COPY transforms/dbt_project.yml .

ENV DBT_PROFILES_DIR /dbt

CMD ["dbt"]