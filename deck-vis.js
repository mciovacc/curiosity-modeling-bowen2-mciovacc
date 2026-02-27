function atomName(atom) {
  // this is to remove the trailing digit on the name of the card
  return atom.toString().replace(/^`/, "").replace(/\d+$/, "");
}

function isTrueAtom(atom) {
  const name = atomName(atom);
  return name === "True" || name === "T" || name === "True0";
}

function chosenCardNames() {
  const names = [];

  if (typeof slot1 !== "undefined") {
    // Visualization-only model: deck uses explicit slots.
    const slots = [slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8];
    for (const slotRel of slots) {
      const tuples = Deck.join(slotRel).tuples();
      for (const tuple of tuples) {
        const atoms = tuple._atoms;
        if (atoms.length < 1) continue;
        names.push(atomName(atoms[0]));
      }
    }
  } else if (typeof chosen !== "undefined") {
    // Standalone visualization model: Deck.chosen is directly a set of cards.
    const tuples = Deck.join(chosen).tuples();
    for (const tuple of tuples) {
      const atoms = tuple._atoms;
      if (atoms.length < 1) continue;
      names.push(atomName(atoms[0]));
    }
  } else if (typeof chosenCards !== "undefined") {
    // Original model: Deck.chosenCards maps Card -> Boolean.
    const tuples = Deck.join(chosenCards).tuples();
    for (const tuple of tuples) {
      const atoms = tuple._atoms;
      if (atoms.length < 2) continue;

      const card = atoms[0];
      const flag = atoms[1];
      if (isTrueAtom(flag)) names.push(atomName(card));
    }
  }

  names.sort((a, b) => a.localeCompare(b));
  return names.slice(0, 8);
}

function cardCell(name, idx) {
  const card = document.createElement("div");
  card.style.height = "150px";
  card.style.borderRadius = "16px";
  card.style.border = "3px solid #f3c84f";
  card.style.background = "linear-gradient(180deg, #4f2fa2 0%, #2b225f 100%)";
  card.style.boxShadow = "0 10px 20px rgba(0,0,0,0.25)";
  card.style.padding = "10px";
  card.style.display = "flex";
  card.style.alignItems = "flex-end";
  card.style.justifyContent = "center";
  card.style.textAlign = "center";
  card.style.color = "#ffffff";
  card.style.fontFamily = "Trebuchet MS, Verdana, sans-serif";
  card.style.fontWeight = "700";
  card.style.fontSize = "14px";

  const label = document.createElement("div");
  label.textContent = name || `Card ${idx + 1}`;
  label.style.background = "rgba(0,0,0,0.35)";
  label.style.padding = "6px 8px";
  label.style.borderRadius = "10px";
  label.style.width = "100%";
  card.appendChild(label);

  return card;
}

function renderDeck() {
  const names = chosenCardNames();

  div.innerHTML = "";
  div.style.margin = "0";
  div.style.overflow = "auto";
  div.style.width = "100%";

  const stage = document.createElement("div");
  stage.style.minHeight = "100%";
  stage.style.width = "100%";
  stage.style.padding = "16px";
  stage.style.background = "linear-gradient(160deg, #4f1f8f 0%, #5e2e96 45%, #3d1f73 100%)";
  stage.style.boxSizing = "border-box";

  const title = document.createElement("div");
  title.textContent = "Valid Clash Royale Deck";
  title.style.color = "#ffffff";
  title.style.fontFamily = "Trebuchet MS, Verdana, sans-serif";
  title.style.fontSize = "22px";
  title.style.fontWeight = "800";
  title.style.marginBottom = "14px";
  stage.appendChild(title);

  const grid = document.createElement("div");
  grid.style.display = "grid";
  grid.style.gridTemplateColumns = "repeat(4, minmax(0, 1fr))";
  grid.style.gap = "10px";

  for (let i = 0; i < 8; i++) {
    grid.appendChild(cardCell(names[i], i));
  }

  stage.appendChild(grid);
  div.appendChild(stage);
}

renderDeck();
