from flask_login import UserMixin
from sqlalchemy.sql import func
from app import db

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), unique=True)
    password_hash = db.Column(db.String(128))
    is_moderator = db.Column(db.Boolean, default=False)
    __tablename__ = 'users'

class Like(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    data_created = db.Column(db.DateTime(timezone=True), default=func.now())
    author = db.Column(db.Integer, db.ForeignKey('user.id', ondelete="CASCADE"), nullable=False)
    recipe_id = db.Column(db.Integer, db.ForeignKey('recipe.id', ondelete="CASCADE"), nullable=False)
    