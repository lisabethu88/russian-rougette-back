from flask import Blueprint, request, jsonify, make_response, abort
from app import db
from app.models.eyeshadow import Makeup


makeup_bp = Blueprint("makeup", __name__, url_prefix="/makeup")