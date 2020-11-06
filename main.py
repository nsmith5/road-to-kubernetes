from flask_api import FlaskAPI
import redis

config = {
    "redis_host": os.environ.get("REDIS_HOST", 'localhost'),
    "redis_port": int(os.environ.get("REDIS_PORT", '6379')),
    "bind_address": os.environ.get("BIND_ADDRESS", '0.0.0.0'),
    "bind_port": int(os.environ.get("BIND_PORT", "5000"))
}
app = FlaskAPI(__name__)
db = redis.Redis(
    host=config["redis_host"],
    port=config["redis_port"]
)


@app.route("/<string:key>/")
def count(key):
    db.incr(key)
    return {key: db.get(key).decode('utf8')}


@app.route("/")
def summary():
    return {key.decode('utf8'): db.get(key).decode('utf8') for key in db.keys("*")}


if __name__ == '__main__':
    app.run(
        host=config["bind_address"],
        port=config["bind_port"]
    )
