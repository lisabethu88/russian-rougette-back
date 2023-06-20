from flask import Blueprint, request, jsonify, make_response, abort
from app import db
from app.models.eyeshadow_option import EyeshadowOption

eyeshadow_option_bp = Blueprint("eyeshadow_option", __name__, url_prefix="/collection")

@eyeshadow_option_bp.route("", methods=["POST"])
def create_tour():
    eyeshadow_option_data = request.get_json()
    try:
        new_eyeshadow = EyeshadowOption.from_dict(eyeshadow_option_data)
    except KeyError as e:
        abort(make_response({"details": f"Request body must include {e[0]}"}, 400))

    db.session.add(new_eyeshadow)
    db.session.commit()

    return make_response(jsonify(new_eyeshadow.to_dict()), 201)