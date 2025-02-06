document.addEventListener("DOMContentLoaded", () => {
  // Выбираем контейнер, в котором происходит прокрутка
  const container = document.querySelector(".recipes-container");
  let page = 2; // Первая порция уже отрендерена на сервере
  let loading = false;

  async function loadMoreRecipes() {
    if (loading) return;
    loading = true;

    try {
      const response = await fetch(`/api/recipes?page=${page}`);
      if (!response.ok) {
        throw new Error(`Ошибка HTTP: ${response.status}`);
      }
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
          <div class="recipes-card">
            <img class="recipes-image" src="${ recipe.image }">
            <div class="recipes-info">
              <h3 class="recipes-name">${ recipe.title }</h3>
              <p class="recipes-description">${ recipe.description }</p>
            </div>
          </div>
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
