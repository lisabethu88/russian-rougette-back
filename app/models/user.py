from app import db
# needed to establish one-to-many relationship
from sqlalchemy.orm import relationship

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), unique=True, nullable=False)
    eyeshadows = db.relationship('Eyeshadow', backref='user', lazy=True)
    eyeshadows = db.relationship('EyeshadowOption', secondary='user_eyeshadows', backref=db.backref('users', lazy=True))


