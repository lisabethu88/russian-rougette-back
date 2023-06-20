from flask import Blueprint, request, jsonify, make_response, abort, session
from werkzeug.security import check_password_hash, generate_password_hash
from app import db
from app.models.customer import Customer
from app.models.eyeshadow import Eyeshadow
from app.routes.helpers import validate_model

customers_bp = Blueprint("customers_bp", __name__, url_prefix="/customers")

# POST /add a customer
@customers_bp.route("/register", methods=["POST"])
def create_customer():
    customer_data = request.get_json() 
    print(customer_data)

    # check if customer exists
    email_exists = Customer.query.filter_by(email=customer_data["email"]).first() is not None
    username_exists = Customer.query.filter_by(username=customer_data["username"]).first() is not None

    if email_exists:
        return make_response(jsonify({"error": "Email already exists"}), 409)
    
    if username_exists:
        return make_response(jsonify({"error": "Username already exists"}), 409)

        
    new_customer = Customer.from_dict(customer_data);
    
    db.session.add(new_customer)
    db.session.commit()
    
    # remember the customer 
    session["customer_id"] = new_customer.id
    
    return make_response(new_customer.to_dict(), 201)


# GET /get a customer
@customers_bp.route("/<int:customer_id>" , methods=["GET"])
def get_current_user(customer_id):
    # customer_id = session.get("customer_id")

    if not customer_id:
        return make_response(jsonify({"error": "Unauthorized"}), 401)
    
    customer = Customer.query.filter_by(id=customer_id).first()
    return jsonify(customer.to_dict()) 

# GET /get all customers
@customers_bp.route('/', methods=['GET'])
def get_customers():
    customers = Customer.query.all()

    customer_list = []
    for customer in customers:
        customer_list.append(customer.to_dict())

    return jsonify(customer_list)


# UPDATE /update a customer
@customers_bp.route('/<int:customer_id>', methods=['PUT'])
def update_customer(customer_id):
    
    customer = validate_model(Customer, customer_id)

    data = request.get_json()

    name = data.get('name')
    email = data.get('email')
    username = data.get('username')
    password = data.get('password')
    eyeshadows = data.get('eyeshadows')

    if name:
        customer.name = name
    if email:
        customer.email = email
    if username:
        customer.username = username
    if password:
        customer.password = password
    if eyeshadows:
        customer.eyeshadows = eyeshadows

    db.session.commit()

    return jsonify({'message': 'Customer updated successfully.'})

# DELETE /delete a customer
@customers_bp.route('/<int:customer_id>', methods=['DELETE'])
def delete_customer(customer_id):

    customer = validate_model(Customer, customer_id)

    db.session.delete(customer)
    db.session.commit()

    return jsonify({'message': 'Customer deleted successfully.'})

# POST /add an eyeshadow to collection
@customers_bp.route("/<customer_id>/collection", methods=["POST"])
def add_eyeshadow(customer_id):
    customer = validate_model(Customer, customer_id)
    eyeshadow_data = request.get_json()
    
    try:
        new_eyeshadow = Eyeshadow.from_dict(eyeshadow_data)
        db.session.add(new_eyeshadow)
        db.session.commit() 
    
    except KeyError as keyerror:
        abort(make_response(
            {"details": f"Request body must include {keyerror.args[0]}."}, 400))
    
    return make_response(new_eyeshadow.to_dict(),201)


# DELETE /delete an eyeshadow from collection
@customers_bp.route('/<int:customer_id>/collection/<int:eyeshadow_id>', methods=['DELETE'])
def delete_eyeshadow(eyeshadow_id, customer_id):
    customer = validate_model(Customer, customer_id)
    eyeshadow = validate_model(Eyeshadow, eyeshadow_id)

    db.session.delete(eyeshadow)
    db.session.commit()

    return jsonify({'message': 'Eyeshadow deleted successfully.'})