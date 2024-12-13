import requests
import json

# Конфигурация
API_KEY = "a114971d4acc4131a3f35fb252a904cb"  # Ваш ключ API
BASE_URL = "https://api.spoonacular.com/recipes/complexSearch"

def fetch_and_save_recipes_to_file(query, number=10, filename="recipes.json"):
    """
    Получить рецепты из Spoonacular API и сразу сохранить их в файл JSON.
    
    Параметры:
        query (str): Поисковый запрос для рецептов.
        number (int): Количество рецептов для получения.
        filename (str): Имя файла для сохранения рецептов.
    """
    params = {
        "apiKey": API_KEY,
        # "query": query,
        "number": number,
        "addRecipeInformation": True,
        "addRecipeInstructions": True
    }

    # Выполняем запрос к API
    response = requests.get(BASE_URL, params=params)
    print(response.headers) 
    if response.status_code != 200:
        print("Ошибка при запросе к API:", response.status_code, response.text)
        return

    # Парсим данные из ответа
    data = response.json()
    recipes = data.get("results", [])

    # Печатаем полученные данные в консоль
    print("Полученные данные из API:", json.dumps(data, ensure_ascii=False, indent=4))

    # Сохраняем данные сразу в файл JSON
    with open(filename, "w", encoding="utf-8") as file:
        json.dump(recipes, file, ensure_ascii=False, indent=4)
    print(f"Рецепты сохранены в файл {filename}")

def main():
    # Пример запроса
    query = "pasta"  # Вы можете менять запрос
    fetch_and_save_recipes_to_file(query, number=10)

if __name__ == "__main__":
    main()
