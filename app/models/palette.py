from app import db

class EyeshadowPalette(db.Model):
    __tablename__ = 'palette'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String)
    brand = db.Column(db.String)

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "brand": self.brand
        }
    
    @classmethod
    def from_dict(cls, palette_data):
        new_palette = EyeshadowPalette(
            name = palette_data["name"],
            brand = palette_data["brand"]
        )
        return new_palette