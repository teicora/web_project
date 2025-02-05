from flask import Blueprint, render_template, jsonify, request
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


@main.route('/api/recipes')
def api_recipes():
    """
    Пример: /api/recipes?page=2
    Возвращает JSON со списком рецептов для указанной страницы.
    """
    # Получаем параметр page (по умолчанию 1)
    page = request.args.get('page', 1, type=int)
    per_page = 5  # Сколько рецептов возвращать на страницу

    # Пагинация через offset и limit
    offset = (page - 1) * per_page
    recipes_query = (db.session.query(Recipe)
                     .order_by(desc(Recipe.likes))
                     .offset(offset)
                     .limit(per_page))
    
    recipes_list = []
    for recipe in recipes_query:
        recipes_list.append({
            "id": recipe.id,
            "name": recipe.title,        # Возможно, recipe.title
            "description": recipe.description
            # Добавьте и другие поля по необходимости
        })
    
    # Возвращаем JSON
    return jsonify(recipes_list)