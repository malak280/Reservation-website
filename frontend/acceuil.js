const app = document.getElementById("app");

function createEl(tag, className, textContent = "") {
  const el = document.createElement(tag);
  if (className) el.className = className;
  if (textContent) el.textContent = textContent;
  return el;
}

// Wrapper utilitaire
function wrapInput(el, withBorder = true) {
  const div = document.createElement("div");
  if (!withBorder) div.style.borderRight = "none";
  div.appendChild(el);
  return div;
}

// ===== HEADER =====
const header = createEl("div", "header");
const headerLeft = createEl("div", "header-left", "OCP Reservation");
const headerRight = createEl("div", "header-right");

const span = document.createElement("span");
span.textContent = "MAD 🇫🇷";
headerRight.appendChild(span);

["Ajouter mon établissement", "S'inscrire", "Se connecter"].forEach(text => {
  const btn = document.createElement("button");
  btn.textContent = text;
  headerRight.appendChild(btn);
});

header.appendChild(headerLeft);
header.appendChild(headerRight);

// ===== MENU =====
const menu = createEl("div", "menu");
[, ,, , ].forEach(item => {
  const link = document.createElement("a");
  link.href = "#";
  link.textContent = item;
  menu.appendChild(link);
});

// ===== MAIN =====
const main = createEl("div", "main");
main.appendChild(createEl("h1", "", "Trouvez votre prochain séjour"));
main.appendChild(createEl("p", "", "Recherchez des offres sur des hôtels, des hébergements indépendants et plus encore"));

// ===== SEARCH BAR =====
const searchBar = createEl("div", "search-bar");

// Champ "Où allez-vous ?"
const inputLieu = document.createElement("input");
inputLieu.type = "text";
inputLieu.placeholder = "Où allez-vous ?";
inputLieu.value = "";
inputLieu.autocomplete = "off";
searchBar.appendChild(wrapInput(inputLieu));

// Date d’arrivée
const inputArrivee = document.createElement("input");
inputArrivee.type = "date";
inputArrivee.value = "";
searchBar.appendChild(wrapInput(inputArrivee));

// Date de départ
const inputDepart = document.createElement("input");
inputDepart.type = "date";
inputDepart.value = "";
searchBar.appendChild(wrapInput(inputDepart));

// Sélecteur "personnes"
const select = document.createElement("select");
[
  "2 adultes - 0 enfant - 1 chambre",
  "1 adulte - 0 enfant - 1 chambre",
  "2 adultes - 2 enfants - 2 chambres"
].forEach(opt => {
  const option = document.createElement("option");
  option.textContent = opt;
  select.appendChild(option);
});
searchBar.appendChild(wrapInput(select));

// Bouton "Rechercher"
const btn = document.createElement("button");
btn.textContent = "Rechercher";
btn.addEventListener("click", () => {
  const ville = encodeURIComponent(inputLieu.value);
  const arrivee = encodeURIComponent(inputArrivee.value);
  const depart = encodeURIComponent(inputDepart.value);
  const personnes = encodeURIComponent(select.value);

  window.location.href = `index2.html?ville=${ville}&arrivee=${arrivee}&depart=${depart}&personnes=${personnes}`;
});
searchBar.appendChild(wrapInput(btn, false));

// Injecter dans la page
app.appendChild(header);
app.appendChild(menu);
app.appendChild(main);
app.appendChild(searchBar);