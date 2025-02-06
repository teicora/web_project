-- Отключаем безопасный режим (если включен)
SET SQL_SAFE_UPDATES = 0;

-- Удаляем записи из userrecipes, где используется этот рецепт
DELETE FROM userrecipes WHERE recipe_id = 14;

-- Удаляем ингредиенты, относящиеся к рецепту из recipeingredients
DELETE FROM recipeingredients WHERE recipe_id = 14;

-- Удаляем ингредиенты, которые больше нигде не используются
DELETE FROM ingredients 
WHERE id NOT IN (SELECT DISTINCT ingredient_id FROM recipeingredients);

-- Удаляем сам рецепт
DELETE FROM recipes WHERE id = 14;

-- Включаем безопасный режим обратно
SET SQL_SAFE_UPDATES = 1;
