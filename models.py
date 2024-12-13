from flask_login import UserMixin
from sqlalchemy.types import Text
from sqlalchemy.sql import func
from database import db

class User(UserMixin, db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), nullable=False, unique=True)
    email = db.Column(db.String(120), nullable=False, unique=True)
    password_hash = db.Column(db.String(255), nullable=False)
    is_moderator = db.Column(db.Boolean, default=False)

    recipes = db.relationship('UserRecipe', backref='user', cascade="all, delete-orphan")

class Recipe(db.Model):
    __tablename__ = 'recipes'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    description = db.Column(db.String(120), nullable=True)
    time = db.Column(db.Integer, nullable=False)  # Time in minutes
    kcal = db.Column(db.Integer, nullable=True)  # Calories
    likes = db.Column(db.Integer, default=0)
    image = db.Column(db.String(80), nullable=True)  # Path to image
    instructions = db.Column(Text)
    user_recipes = db.relationship('UserRecipe', backref='recipe', cascade="all, delete-orphan")
    ingredients = db.relationship('RecipeIngredient', backref='recipe', cascade="all, delete-orphan")

class Ingredient(db.Model):
    __tablename__ = 'ingredients'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), nullable=False, unique=True)

    recipe_ingredients = db.relationship('RecipeIngredient', backref='ingredient', cascade="all, delete-orphan")

class RecipeIngredient(db.Model):
    __tablename__ = 'recipeingredients'
    id = db.Column(db.Integer, primary_key=True)
    recipe_id = db.Column(db.Integer, db.ForeignKey('recipes.id', ondelete="CASCADE"), nullable=False)
    ingredient_id = db.Column(db.Integer, db.ForeignKey('ingredients.id', ondelete="CASCADE"), nullable=False)

class UserRecipe(db.Model):
    __tablename__ = 'userrecipes'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id', ondelete="CASCADE"), nullable=False)
    recipe_id = db.Column(db.Integer, db.ForeignKey('recipes.id', ondelete="CASCADE"), nullable=False)