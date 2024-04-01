from flask import render_template, request, redirect, url_for
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import login_user, logout_user, login_required, current_user
from sqlalchemy import text
from app import db
from models import User
from flask import Blueprint

main = Blueprint('main', __name__)   

#Some new text

@main.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        user = User(username=username, password_hash=generate_password_hash(password))
        db.session.add(user)
        db.session.commit()
        return redirect(url_for('main.login'))
    return render_template('register.html')

@main.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        print("Im in")
        user = User.query.filter_by(username=username).first()
        if user and check_password_hash(user.password_hash, password):
            print("Im actualy in")
            login_user(user)
            return redirect(url_for('main.home'))
    return render_template('login.html')

@main.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('main.home'))

@main.route('/profile')
@login_required
def profile():
    return render_template('profile.html')

@main.route('/recipes')
def recipes():
    return render_template('recipes.html')


@main.route('/')
def home():
    
    exclude_ingr = ''
    recipes = db.session.execute(text("call exclude_ingr(:exclude_ingr)"), {"exclude_ingr": exclude_ingr})
    #Строка -> в запрос, воспринимает как текст, ошибка формата. !!! 
    #Авторизация!
    return render_template('home.html', recipes=recipes, title=title, banner_title=banner_title)

@main.route('/favourites/<int:page>')
def favourites(page):
    recipes = db.session.execute(text("select * from recipes limit 16 offset :page", {"page": page}))

@main.route('/recipe/<int:recipe_id>')
def recipe_content(recipe_id):
    data = db.session.execute(text("select recipes.instructions from recipes where recipes.id = :recipe_id"), {"recipe_id": recipe_id})
    instructions = data.fetchone()[0]
    return render_template('recipe.html', instructions=instructions, title=title, banner_title=banner_title)

title = "В тренде"
banner_title = "Избавьтесь от привычек, позаботьтесь о здоровье: ваше путешествие к лучшему завтра начинается сегодня!"
