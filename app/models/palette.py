from app import db

class EyeshadowPalette(db.Model):
    __tablename__ = 'palette'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String)
    brand = db.Column(db.String)
    eyeshadows = db.relationship('Eyeshadow', back_populates='palette')