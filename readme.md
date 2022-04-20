# Run FastApi behind Apache without reverse proxy

This is an example repository, to show how to run [FastAPI](https://fastapi.tiangolo.com/) behind [Apache HTTP Server](https://httpd.apache.org/) without reverse proxy, but using [mod_wsgi](https://modwsgi.readthedocs.io/) with a [venv](https://docs.python.org/3/library/venv.html) and the [WSGIMiddleware](https://github.com/abersheeran/a2wsgi) instead.

In some cases, it is not an option or not wanted to run a separate server process (like using [Uvicorn](https://www.uvicorn.org/)).

This example is in a [Docker container](https://www.docker.com/), so you can run it with:

```shell
> docker compose up
```

and check the result with:

```shell
> curl http://localhost:8080/
{"message":"Hello World 👋"}
```

… but it is more meant to be a documentation and one can install the same everywhere.
