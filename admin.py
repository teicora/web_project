from flask import Blueprint, render_template, request, redirect, url_for
from flask_login import login_required, current_user
from app import db
from models import User

admin = Blueprint('admin', __name__)

@admin.route('/add_recipe', methods=['GET', 'POST'])
@login_required
def add_recipe():
    if not current_user.is_moderator:
        return redirect(url_for('main.home'))  # Запрет доступа для неадминистраторов

    if request.method == 'POST':
        recipe_name = request.form.get('recipe_name')
        instructions = request.form.get('instructions')
        db.session.execute(
            "INSERT INTO recipes (name, instructions) VALUES (:name, :instructions)",
            {"name": recipe_name, "instructions": instructions}
        )
        db.session.commit()
        return redirect(url_for('admin.add_recipe'))
    return render_template('add_recipe.html')
