from app import db

class Customer(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(50), unique=True, nullable=False)
    name = db.Column(db.String)
    email = db.Column(db.String) 
    password = db.Column(db.String)    
    eyeshadows = db.relationship('Eyeshadow', back_populates='customers')


    def to_dict(self):
        return {
            "id": self.id,
            "username": self.username,
            "name": self.name,
            "email": self.email,
            "password": self.password,
            "eyeshadows": [list(eyeshadows.to_dict()) for eyeshadows in self.eyeshadows]
        }

    @classmethod
    def from_dict(cls, customer_data):
        new_customer = Customer(
            username = customer_data["username"],
            name = customer_data["name"],
            email = customer_data["email"],
            password = customer_data["password"],
            eyeshadows = customer_data["eyeshadows"]
        )
        return new_customer