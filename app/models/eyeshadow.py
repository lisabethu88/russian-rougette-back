from app import db


class Eyeshadow(db.Model):
    __tablename__ = 'eyeshadows'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=False)
    brand = db.Column(db.String(50))
    finish = db.Column(db.String(50))
    form = db.Column(db.String(50))
    color = db.Column(db.String(6))
    customer_id = db.Column(db.Integer, db.ForeignKey('customer.id'), nullable=False)
    customers = db.relationship('Customer', back_populates='eyeshadows')
    palette_id = db.Column(db.Integer, db.ForeignKey('palette.id'), nullable=False)


    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "brand": self.brand,
            "finish": self.finish,
            "form": self.form,
            "color": self.color,
            "customer_id": self.customer_id
        }
    
    @classmethod
    def from_dict(cls, eyeshadow_data):
        new_eyeshadow = Eyeshadow(
            name = eyeshadow_data["name"],
            brand = eyeshadow_data["brand"],
            finish = eyeshadow_data["finish"],
            form = eyeshadow_data["form"],
            color = eyeshadow_data["color"],
            customer_id = eyeshadow_data["customer_id"]
        )
        return new_eyeshadow