document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".like-button").forEach(button => {
        button.addEventListener("click", function () {
            let recipeId = this.getAttribute("data-recipe");
            fetch(`/like/${recipeId}`, { method: "POST" })
                .then(response => response.json())
                .then(data => {
                    document.getElementById(`likes-${recipeId}`).textContent = data.likes;
                    this.classList.toggle("liked", data.liked);
                });
        });
    });
});
