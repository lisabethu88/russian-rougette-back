from app import db
# needed to establish one-to-many relationship
from sqlalchemy.orm import relationship

class EyeshadowOption(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    brand = db.Column(db.String(50))
    finish = db.Column(db.String(50))
    form = db.Column(db.String(50))
    color = db.Column(db.String(6))
    user_eyeshadows = db.Table('user_eyeshadows',
        db.Column('user_id', db.Integer, db.ForeignKey('user.id'), primary_key=True),
        db.Column('eyeshadow_option_id', db.Integer, db.ForeignKey('eyeshadow_option.id'), primary_key=True)
    )
    users = db.relationship('User', secondary=user_eyeshadows, backref=db.backref('eyeshadows', lazy=True))

