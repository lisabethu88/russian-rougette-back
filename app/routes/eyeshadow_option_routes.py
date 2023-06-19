from flask import Blueprint, request, jsonify, make_response, abort
from app import db
from app.models.eyeshadow_option import EyeshadowOption