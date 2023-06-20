from flask import Blueprint, request, jsonify, make_response, abort
from app import db
from app.models.customer import Customer

customers_bp = Blueprint("customers_bp", __name__)

# POST /add customer
@customers_bp.route("/register", methods=["POST"])
def create_customer():
    customer_data = request.get_json() 
    print(customer_data)
    # check if customer exists
    customer_exist = Customer.query.filter_by(email=customer_data["email"]).first() is not None
    if customer_exist:
        return make_response(jsonify({"error": "Customer already exists"}), 409)

    new_customer = Customer.from_dict(customer_data);
    
    db.session.add(new_customer)
    db.session.commit()
    
    # remember the customer 
    # session["customer_id"] = new_customer.id
    
    return make_response(new_customer.to_dict(), 201)
