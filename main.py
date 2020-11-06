from flask_api import FlaskAPI
import redis

app = FlaskAPI(__name__)
db = redis.Redis(host='localhost', port=6379)


@app.route("/<string:key>/")
def count(key):
    db.incr(key)
    return {key: db.get(key).decode('utf8')}


@app.route("/")
def summary():
    return {key.decode('utf8'): db.get(key).decode('utf8') for key in db.keys("*")}


if __name__ == '__main__':
    app.run()
