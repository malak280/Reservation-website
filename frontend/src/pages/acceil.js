const app = document.getElementById("app");

function createEl(tag, className, textContent = "") {
  const el = document.createElement(tag);
  if (className) el.className = className;
  if (textContent) el.textContent = textContent;
  return el;
}

// Header
const header = createEl("div", "header");
const headerLeft = createEl("div", "header-left", "Booking.com");
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

// Menu
const menu = createEl("div", "menu");
["🛏️ Hébergements", "✈️ Vols", "🚗 Voitures de location", "🎡 Attractions", "🚕 Taxis aéroport"].forEach(item => {
  const link = document.createElement("a");
  link.href = "#";
  link.textContent = item;
  menu.appendChild(link);
});

// Main
const main = createEl("div", "main");
main.appendChild(createEl("h1", "", "Trouvez votre prochain séjour"));
main.appendChild(createEl("p", "", "Recherchez des offres sur des hôtels, des hébergements indépendants et plus encore"));

// Search bar
const searchBar = createEl("div", "search-bar");

const inputLieu = document.createElement("input");
inputLieu.type = "text";
inputLieu.placeholder = "Où allez-vous ?";
searchBar.appendChild(wrapInput(inputLieu));

const inputArrivee = document.createElement("input");
inputArrivee.type = "date";
searchBar.appendChild(wrapInput(inputArrivee));

const inputDepart = document.createElement("input");
inputDepart.type = "date";
searchBar.appendChild(wrapInput(inputDepart));

const select = document.createElement("select");
["2 adultes - 0 enfant - 1 chambre", "1 adulte - 0 enfant - 1 chambre", "2 adultes - 2 enfants - 2 chambres"].forEach(opt => {
  const option = document.createElement("option");
  option.textContent = opt;
  select.appendChild(option);
});
searchBar.appendChild(wrapInput(select));

const btn = document.createElement("button");
btn.textContent = "Rechercher";
searchBar.appendChild(wrapInput(btn, false));

function wrapInput(el, withBorder = true) {
  const div = document.createElement("div");
  if (!withBorder) div.style.borderRight = "none";
  div.appendChild(el);
  return div;
}

// Inject into page
app.appendChild(header);
app.appendChild(menu);
app.appendChild(main);
app.appendChild(searchBar);