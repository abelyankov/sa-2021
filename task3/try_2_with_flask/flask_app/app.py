import os
import json

from flask import Flask, request

app = Flask(__name__)
config = {
    "DATABASE_URI": os.environ.get("DATABASE_URI", ""),
    "HOSTNAME": os.environ["HOSTNAME"],
    "GREETING": os.environ.get("GREETING", "SALAM")
}

@app.route("/")
def hello():
    return config["GREETING"] + " from " + config["HOSTNAME"]

@app.route("/config")
def configuration():
    return json.dumps(config)

@app.route("/version")
def version():
    return {"version": "1.0.0"}

@app.route("/sup")
def sup():
    return {"nuyaziv": "true "}

@app.route("/db")
def df():
    from sqlalchemy import create_engine

    engine = create_engine(config["DATABASE_URI"], echo=True)
    rows = []

    with engine.connect() as connection:
        result = connection.execute("select id, name from users")
        rows = [dict(r.items()) for r in result]

    return json.dumps(rows)


@app.route("/users", methods=["POST", "GET"])
def users():
    if request.method == "GET":
        from sqlalchemy import create_engine

        engine = create_engine(config["DATABASE_URI"].strip(), echo=True)
        rows = []

        with engine.connect() as connection:
            result = connection.execute("select id, name from users")
            rows = [dict(r.items()) for r in result]

        return json.dumps(rows)
    else:
        body = request.json
        id = int(body["id"])
        name = str(body["name"])
        from sqlalchemy import create_engine

        engine = create_engine(config["DATABASE_URI"].strip(), echo=True)
        rows = []

        with engine.connect() as connection:
            result = connection.execute(f"insert into users(id, name) values({str(id)}, '{name}')")
            print(result)

        return {"status": "jiv cel orel, +1 user."}


@app.route("/users/<int:id>", methods=["GET"])
def user(id):
  from sqlalchemy import create_engine
  engine = create_engine(config["DATABASE_URI"].strip(), echo=True)
  rows = []
  with engine.connect() as connection:
    result = connection.execute("select id, name from users where users.id = {}".format(id))
    rows = [dict(r.items()) for r in result]
  return json.dumps(rows)

@app.route("/users/<int:id>", methods=["PUT"])
def user_put(id):
  body = request.json
  name = str(body["name"])
  from sqlalchemy import create_engine

  engine = create_engine(config["DATABASE_URI"].strip(), echo=True)
  rows = []

  with engine.connect() as connection:
      result = connection.execute(f"update users SET name = '{name}' WHERE users.id = {id}")
      print(result)

  return {"status": "jiv cel orel, +1 user updated."}

@app.route("/users/<int:id>", methods=["DELETE"])
def user_delete(id):
  from sqlalchemy import create_engine
  engine = create_engine(config["DATABASE_URI"].strip(), echo=True)
  rows = []
  with engine.connect() as connection:
      result = connection.execute(f"delete from users where users.id = {id}")
      print(result)

  return {"status": "jiv cel orel, -1 user."}