document.addEventListener("DOMContentLoaded", () => {
    const container = document.querySelector(".frame");
    let page = 2; // Начинаем со второй страницы, так как первая уже отрисована
    let loading = false;
  
    async function loadMoreRecipes() {
      if (loading) return;
      loading = true;
  
      try {
        const response = await fetch(`/api/recipes?page=${page}`);
        const newRecipes = await response.json();
  
        if (newRecipes.length === 0) {
          container.removeEventListener("scroll", handleScroll);
          return;
        }
  
        newRecipes.forEach((recipe) => {
          const recipeElement = document.createElement("div");
          recipeElement.className = "recipe";
          recipeElement.innerHTML = `
            <h3>${recipe.name}</h3>
            <p>${recipe.description}</p>
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
      if (container.scrollHeight - container.scrollTop <= container.clientHeight + 50) {
        loadMoreRecipes();
      }
    }
  
    container.addEventListener("scroll", handleScroll);
  });
  