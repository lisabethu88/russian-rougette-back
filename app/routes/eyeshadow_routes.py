from flask import Blueprint, request, jsonify, make_response, abort
from app import db
from app.models.eyeshadow import Eyeshadow
from app.models.customer import Customer
from app.routes.helpers import *


eyeshadow_bp = Blueprint("eyeshadow", __name__, url_prefix="/collection")