import requests
from pprint import pprint  # Для красивого вывода

API_KEY = "a114971d4acc4131a3f35fb252a904cb"
BASE_URL = "https://api.spoonacular.com/recipes/complexSearch"

params = {
    "query": "pasta",
    "fillIngredients": "true",
    "addRecipeInformation": "true",
    "addRecipeInstructions": "true",
    "instructionsRequired": "true",
    "number": 5,
    "apiKey": API_KEY
}

response = requests.get(BASE_URL, params=params)

if response.status_code == 200:
    data = response.json()
    pprint(data)  # Красивый вывод JSON-данных
else:
    print(f"Ошибка: {response.status_code}, {response.text}")
