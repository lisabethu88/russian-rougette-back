from flask import Blueprint, request, jsonify, make_response, abort
from app import db
from app.models.palette import EyeshadowPalette
from app.models.eyeshadow import Eyeshadow
from app.routes.helpers import *


eyeshadow_bp = Blueprint("eyeshadow", __name__)

# -------------------------------------
# EYESHADOW ROUTES
# -------------------------------------
# POST /add an eyeshadow to collection
@eyeshadow_bp.route("/", methods=["POST"])
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
@eyeshadow_bp.route('/eyeshadows/<int:eyeshadow_id>', methods=['DELETE'])
def delete_eyeshadow(eyeshadow_id, customer_id):
    customer = validate_model(Customer, customer_id)
    eyeshadow = validate_model(Eyeshadow, eyeshadow_id)

    db.session.delete(eyeshadow)
    db.session.commit()

    return jsonify({'message': 'Eyeshadow deleted successfully.'})


# GET /get all eyeshadows
@eyeshadow_bp.route('/eyeshadows', methods=['GET'])
def get_eyeshadows():
    eyeshadows = Eyeshadow.query.all()

    eyeshadow_list = []
    for eyeshadow in eyeshadows:
        eyeshadow_list.append(eyeshadow.to_dict())

    return jsonify(eyeshadow_list)


# GET /get a palette
@eyeshadow_bp.route('/palettes/<int:palette_id>', methods=['GET'])
def get_palette(palette_id):
    if not palette_id:
        return make_response(jsonify({"error": "Unauthorized"}), 401)
    
    palette = EyeshadowPalette.query.filter_by(id=palette_id).first()
    print(palette)
    return jsonify(palette.to_dict()) 


# GET /get all eyeshadows
@eyeshadow_bp.route('/palettes', methods=['GET'])
def get_palettes():
    palettes = EyeshadowPalette.query.all()

    palettes_list = []
    for palette in palettes:
        palettes_list.append(palette.to_dict())

    return jsonify(palettes_list)

# GET /get all eyeshadows by palette id
@eyeshadow_bp.route('/eyeshadows/<int:palette_id>', methods=['GET'])
def get_eyeshadows_by_palette_id(palette_id):
    palettes = EyeshadowPalette.query.all()

    palettes_list = []
    for palette in palettes:
        palettes_list.append(palette.to_dict())
    
    try:
        eyeshadows = Eyeshadow.query.filter_by(palette_id=palette_id).all()
        eyeshadow_list = []
        for eyeshadow in eyeshadows:
            eyeshadow_data = Eyeshadow.to_dict(eyeshadow)
            eyeshadow_list.append(eyeshadow_data)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

    return jsonify(eyeshadow_list)


