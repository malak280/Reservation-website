import { useState } from "react";

export default function HotelFilters({ onFilter }) {
  const [ville, setVille] = useState("");
  const [dateDebut, setDateDebut] = useState("");
  const [dateFin, setDateFin] = useState("");
  const [personnes, setPersonnes] = useState(1);

  const handleSubmit = (e) => {
    e.preventDefault();
    onFilter({ ville, dateDebut, dateFin, personnes });
  };

  return (
    <form onSubmit={handleSubmit} className="p-4 border rounded w-full max-w-md">
      <input value={ville} onChange={e => setVille(e.target.value)} placeholder="Ville" />
      <input type="date" value={dateDebut} onChange={e => setDateDebut(e.target.value)} />
      <input type="date" value={dateFin} onChange={e => setDateFin(e.target.value)} />
      <input type="number" value={personnes} onChange={e => setPersonnes(e.target.value)} min={1} />
      <button type="submit">Filtrer</button>
    </form>
  );
}
