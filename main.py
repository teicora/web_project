from flask import Blueprint, render_template
from sqlalchemy import text, desc
from app import db
from models import Recipe

main = Blueprint('main', __name__)

title = "В тренде"
banner_title = "Избавьтесь от привычек, позаботьтесь о здоровье: ваше путешествие к лучшему завтра начинается сегодня!"

@main.route('/')
def home():
    exclude_ingr = ''
    recipes = db.session.execute(text("call exclude_ingr(:exclude_ingr)"), {"exclude_ingr": exclude_ingr})
    return render_template('home.html', recipes=recipes, title=title, banner_title=banner_title)

@main.route('/recipes')
def recipes():
    recipes = db.session.query(Recipe).order_by(desc(Recipe.likes)).limit(10).all()
    return render_template('recipes.html', recipes=recipes)

@main.route('/profile')
def profile():
    return render_template('profile.html')

@main.route('/favourites')
def favourites():
    return render_template('favourites.html')

@main.route('/recipe/<int:recipe_id>')
def recipe_content(recipe_id):
    data = db.session.execute(text("select recipes.instructions from recipes where recipes.id = :recipe_id"), {"recipe_id": recipe_id})
    instructions = data.fetchone()[0]
    return render_template('recipe.html', instructions=instructions, title=title, banner_title=banner_title)

