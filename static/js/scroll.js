document.addEventListener("DOMContentLoaded", () => {
  const container = document.querySelector(".frame");
  let page = 2; // Начинаем со второй страницы, так как первая уже отображена
  let loading = false;

  async function loadMoreRecipes() {
    if (loading) return;
    loading = true;

    try {
      const response = await fetch(`/api/recipes?page=${page}`);
      const newRecipes = await response.json();

      // Если новых рецептов нет, отцепляем обработчик скролла
      if (newRecipes.length === 0) {
        container.removeEventListener("scroll", handleScroll);
        return;
      }

      // Добавляем новые рецепты в контейнер
      newRecipes.forEach((recipe) => {
        const recipeElement = document.createElement("div");
        recipeElement.className = "recipe";
        recipeElement.innerHTML = `
            <h3><a href="/recipe/{{ recipe.id }}">${ recipe.title }</a></h3>
            <p>${ recipe.description }</p>
        `;
        container.appendChild(recipeElement);
      });

      page++;
    } catch (error) {
      console.error("Ошибка загрузки рецептов:", error);
    } finally {
      loading = false;
    }
  }

  function handleScroll() {
    // Если пользователь прокрутил контейнер почти до конца
    if (container.scrollHeight - container.scrollTop <= container.clientHeight + 50) {
      loadMoreRecipes();
    }
  }

  container.addEventListener("scroll", handleScroll);
});
