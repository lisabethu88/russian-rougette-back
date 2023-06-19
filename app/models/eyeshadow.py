from app import db
# needed to establish one-to-many relationship
from sqlalchemy.orm import relationship


class Eyeshadow(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=False)
    brand = db.Column(db.String(50))
    finish = db.Column(db.String(50))
    form = db.Column(db.String(50))
    color = db.Column(db.BYTEA())
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)