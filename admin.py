import os
from flask import Blueprint, render_template, request, redirect, url_for, current_app, flash
from flask_login import login_required, current_user
from app import db
from werkzeug.utils import secure_filename
from models import Recipe, Ingredient, UserRecipe, RecipeIngredient  # Ваши SQLAlchemy модели
import time 

admin = Blueprint('admin', __name__)

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}  # Разрешённые форматы файлов

def allowed_file(filename):
    """Проверяет, допустим ли формат файла."""
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@admin.route('/add_recipe', methods=['GET', 'POST'])
@login_required
def add_recipe():
    # Проверка прав модератора
    if not current_user.is_moderator:
        flash("У вас нет прав для добавления рецептов.", "warning")
        return redirect(url_for('main.home'))

    if request.method == 'POST':
        # Получаем данные из формы
        title = request.form.get('title')
        description = request.form.get('description')
        cooking_time = request.form.get('time')
        kcal = request.form.get('kcal')
        instructions = request.form.get('instructions')
        ingredients_str = request.form.get('ingredients')

        # Проверка обязательных полей
        if not title or not instructions or not ingredients_str:
            flash("Заполните все обязательные поля.", "danger")
            return redirect(url_for('admin.add_recipe'))

        # Обработка изображения
        image_file = request.files.get('image')
        image_filename = None

        if image_file and image_file.filename != '':
            if allowed_file(image_file.filename):
                # Генерируем безопасное имя файла
                filename = secure_filename(image_file.filename)
                # Формируем относительный путь от static (например, "images/1679823412_photo.jpg")
                image_filename = f"{int(time.time())}_{filename}"
                relative_path = "static/images/" + image_filename
                # Абсолютный путь для сохранения файла
                absolute_path = os.path.join(current_app.static_folder, os.path.join('images', image_filename))
                # Убедимся, что папка существует
                os.makedirs(os.path.join(current_app.static_folder, 'images'), exist_ok=True)
                image_file.save(absolute_path)
            else:
                flash("Формат изображения недопустим. Разрешены: png, jpg, jpeg.", "danger")
                return redirect(url_for('admin.add_recipe'))

        # Создаём новый рецепт
        new_recipe = Recipe(
            title=title,
            description=description,    
            time=int(cooking_time),
            kcal=int(kcal),
            instructions=instructions,
            image=relative_path,  # сохраняем относительный путь, например "images/1679823412_photo.jpg"
            likes=0  # По умолчанию 0 лайков
        )
        db.session.add(new_recipe)
        db.session.commit()

        # Связываем рецепт с текущим пользователем
        user_recipe = UserRecipe(user_id=current_user.id, recipe_id=new_recipe.id)
        db.session.add(user_recipe)
        db.session.commit()

        # Обрабатываем ингредиенты
        ingredients_list = [ing.strip() for ing in ingredients_str.split(',') if ing.strip()]
        for ing_name in ingredients_list:
            # Проверяем, существует ли ингредиент
            ingredient = Ingredient.query.filter_by(name=ing_name).first()
            if not ingredient:
                # Если ингредиента нет, создаём его
                ingredient = Ingredient(name=ing_name)
                db.session.add(ingredient)
                db.session.commit()

            # Связываем ингредиент с рецептом
            recipe_ingredient = RecipeIngredient(recipe_id=new_recipe.id, ingredient_id=ingredient.id)
            db.session.add(recipe_ingredient)

        # Сохраняем все изменения
        db.session.commit()

        flash("Рецепт успешно добавлен!", "success")
        return redirect(url_for('admin.add_recipe'))

    return render_template('add_recipe.html')
