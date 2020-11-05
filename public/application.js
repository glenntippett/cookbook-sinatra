// setAttributes(elem, {"src": "http://example.com/something.jpeg", "height": "100%", ...});
const setAttributes = (el, attrs) => {
  for(var key in attrs) {
    el.setAttribute(key, attrs[key]);
  }
}

const addIngredientToList = () => {
    var ul = document.getElementById("ingredient-list-ul");
    var li = document.createElement("li");
    var text = document.getElementById("ingredient-input").value;
    li.appendChild(document.createTextNode(text));
    li.setAttribute("class", "list-group-item");
    ul.appendChild(li);
}

document.querySelector("#add-ingredient-btn").addEventListener("click", addIngredientToList);

