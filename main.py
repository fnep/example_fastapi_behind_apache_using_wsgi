from fastapi import FastAPI
from a2wsgi import ASGIMiddleware

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World 👋"}


# mod_wsgi expects the name 'application' by default
application = ASGIMiddleware(app)
