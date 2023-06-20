from flask import Blueprint, request, jsonify, make_response, abort
from app import db
from app.models.eyeshadow import Eyeshadow
from app.models.customer import Customer
from app.routes.helpers import *


eyeshadow_bp = Blueprint("eyeshadow", __name__, url_prefix="/eyeshadow")

# POST
@eyeshadow_bp.route("/<customer_id>/collection", methods=["POST"])
def add_eyeshadow(customer_id):
    eyeshadow_data = request.get_json()
    print(eyeshadow_data)
    
    customer = validate_model(Customer, eyeshadow_data["customer_id"])
    
    try:
        new_eyeshadow = Eyeshadow(
                name = eyeshadow_data["name"],
                brand = eyeshadow_data["brand"],
                finish = eyeshadow_data["finish"],
                form = eyeshadow_data["form"],
                color = eyeshadow_data["color"],
                customer_id = eyeshadow_data["customer_id"]
            )
        db.session.add(new_eyeshadow)
        db.session.commit() 
    
    except KeyError as keyerror:
        abort(make_response(
            {"details": f"Request body must include {keyerror.args[0]}."}, 400))
    
    return make_response(new_eyeshadow.to_dict(),201)