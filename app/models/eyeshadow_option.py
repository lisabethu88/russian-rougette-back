from app import db

class EyeshadowOption(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    brand = db.Column(db.String(50))
    finish = db.Column(db.String(50))
    form = db.Column(db.String(50))
    color = db.Column(db.String(7))
