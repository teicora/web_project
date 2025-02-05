import json
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import db, Recipe, Ingredient, RecipeIngredient  # Ваши модели

# Подключение к базе данных
DATABASE_URI = "mysql+pymysql://root:3110@localhost/nutrifood"  # Замените на URI вашей БД
engine = create_engine(DATABASE_URI)
Session = sessionmaker(bind=engine)
session = Session()

def load_recipes_from_file(filename="recipes.json"):
    """Загрузить рецепты из файла JSON."""
    with open(filename, "r", encoding="utf-8") as file:
        recipes = json.load(file)
    return recipes

def insert_recipe_into_db(recipe_data):
    """Вставить рецепт и его ингредиенты в базу данных."""
    # Проверяем, есть ли рецепт уже в базе по названию
    existing_recipe = session.query(Recipe).filter_by(title=recipe_data["title"]).first()
    if existing_recipe:
        print(f"Рецепт '{recipe_data['title']}' уже существует.")
        return

    # Создаем объект Recipe
    new_recipe = Recipe(
        title=recipe_data["title"],
        description=recipe_data.get("summary", "")[:120],  # Ограничение на 120 символов
        time = (recipe_data.get("preparationMinutes") or 0) + (recipe_data.get("cookingMinutes") or 0),
        kcal=0,  # Преобразование цены в калории (пример)
        likes=0,
        image=recipe_data.get("image", ""),
        instructions="\n".join(
            step["step"] for instruction in recipe_data.get("analyzedInstructions", []) for step in instruction.get("steps", []))
    )

    # Добавляем рецепт в сессию
    session.add(new_recipe)
    session.commit()  # Нужно, чтобы получить ID для связи с ингредиентами

    # Добавляем ингредиенты
    for instruction in recipe_data.get("analyzedInstructions", []):
        for step in instruction.get("steps", []):
            for ingredient in step.get("ingredients", []):
                ingredient_name = ingredient["name"]
                # Проверяем, есть ли ингредиент в базе
                existing_ingredient = session.query(Ingredient).filter_by(name=ingredient_name).first()

                if not existing_ingredient:
                    # Если ингредиента нет, добавляем его
                    new_ingredient = Ingredient(name=ingredient_name)
                    session.add(new_ingredient)
                    session.commit()  # Коммитим, чтобы получить ID ингредиента
                else:
                    new_ingredient = existing_ingredient

                # Связываем рецепт с ингредиентом
                recipe_ingredient = RecipeIngredient(recipe_id=new_recipe.id, ingredient_id=new_ingredient.id)
                session.add(recipe_ingredient)

    # Финальный коммит
    session.commit()
    print(f"Рецепт '{new_recipe.title}' добавлен в базу данных.")

def main():
    # Чтение рецептов из файла
    recipes = load_recipes_from_file()

    if not recipes:
        print("Нет данных для вставки.")
        return

    for recipe_data in recipes:
        insert_recipe_into_db(recipe_data)

if __name__ == "__main__":
    main()
