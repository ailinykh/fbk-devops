from flask import Flask, request
from flask_sqlalchemy import SQLAlchemy
from os import environ

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = environ.get('SQLALCHEMY_DATABASE_URI')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


class FBKModel(db.Model):
    __tablename__ = 'fbk_table'

    id = db.Column(db.Integer, primary_key=True)
    fbk_value = db.Column(db.String())
    # created_at = db.Column(db.DateTime())

    def __init__(self, fbk_value):
        self.fbk_value = fbk_value

    def __repr__(self):
        return f"<FBKModel {self.fbk_value}>"


@app.route("/", methods=["POST"])
def index():
    if not "value" in request.form:
        return 'Insufficient parameters, "value" missed', 400
    
    value = FBKModel(fbk_value=request.form["value"])
    db.session.add(value)
    db.session.commit()
    return "ok"

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')