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
    createHiddenInput(text, li, "ingredients[]");
}

const addMethodToList = () => {
  var ol = document.getElementById("method-list-ol");
  var li = document.createElement("li");
  var text = document.getElementById("recipe-method-input").value;
  li.appendChild(document.createTextNode(text));
  ol.appendChild(li);
  createHiddenInput(text, ol, "steps[]")
}

const createHiddenInput = (text, li, arr) => {
  var input = document.createElement("input");
  input.value = text;
  input.setAttribute("name", arr);
  li.appendChild(input)
  input.hidden = true;
}

document.querySelector("#add-ingredient-btn").addEventListener("click", addIngredientToList);
document.querySelector("#add-method-btn").addEventListener("click", addMethodToList);