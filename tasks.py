from invoke import task


@task
def build(c):
    print("Building docker compose infrastructure")
    c.run("docker-compose build", pty=True)


@task
def start(c):
    print("Running dbt container and entering...")
    c.run("docker-compose up", pty=True)


@task
def db(c):
    print("Running db container")
    c.run("docker exec -it pg_db pgcli -U postgres -d postgres", pty=True)

@task
def db_local(c):
    c.run("pgcli -h localhost -U postgres -p 5432", pty=True)