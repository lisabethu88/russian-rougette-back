from app import db


class Eyeshadow(db.Model):
    __tablename__ = 'eyeshadows'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=False)
    brand = db.Column(db.String(50))
    finish = db.Column(db.String(50))
    form = db.Column(db.String(50))
    color = db.Column(db.String(7)) 
    palette_id = db.Column(db.Integer, db.ForeignKey('palette.id'))
    single = db.Column(db.Boolean())


    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "brand": self.brand,
            "finish": self.finish,
            "form": self.form,
            "color": self.color,
            "palette_id": self.palette_id
        }
    
    @classmethod
    def from_dict(cls, eyeshadow_data):
        new_eyeshadow = Eyeshadow(
            name = eyeshadow_data["name"],
            brand = eyeshadow_data["brand"],
            finish = eyeshadow_data["finish"],
            form = eyeshadow_data["form"],
            color = eyeshadow_data["color"],
            palette_id = eyeshadow_data["palette_id"]
        )
        return new_eyeshadow