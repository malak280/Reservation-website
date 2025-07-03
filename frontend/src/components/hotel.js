/*import { useState } from "react";
import axios from "axios";

export default function AddHotelForm() {
  const [hotel, setHotel] = useState({ nom: "", ville: "", adresse: "", prix: "" });

  const handleChange = (e) => {
    setHotel({ ...hotel, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://localhost:5001/hotel", hotel);
      alert("Hôtel ajouté !");
    } catch (err) {
      console.error("Erreur :", err);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="p-4 border rounded w-full max-w-md">
      <input name="nom" placeholder="Nom" value={hotel.nom} onChange={handleChange} required />
      <input name="ville" placeholder="Ville" value={hotel.ville} onChange={handleChange} required />
      <input name="adresse" placeholder="Adresse" value={hotel.adresse} onChange={handleChange} required />
      <input name="prix" type="number" placeholder="Prix" value={hotel.prix} onChange={handleChange} required />
      <button type="submit">Ajouter</button>
    </form>
  );
}*/
import { useState } from "react";
import axios from "axios";

export default function AddHotelForm() {
  const [hotel, setHotel] = useState({ nom: "", ville: "", adresse: "", prix: "" });

  const handleChange = (e) => {
    setHotel({ ...hotel, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://localhost:5001/hotel", hotel);
      alert("Hôtel ajouté !");
      setHotel({ nom: "", ville: "", adresse: "", prix: "" }); // reset
    } catch (err) {
      console.error("Erreur :", err);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-beige-100">
      <form
        onSubmit={handleSubmit}
        className="bg-white shadow-lg rounded-2xl p-8 w-full max-w-lg border border-green-300"
        style={{ backgroundColor: "#fefae0" }} // beige clair
      >
        <h2 className="text-2xl font-semibold mb-6 text-green-800">Ajouter un Hôtel</h2>

        <div className="mb-4">
          <label className="block text-green-900 mb-1">Nom</label>
          <input
            name="nom"
            value={hotel.nom}
            onChange={handleChange}
            required
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
            placeholder="Nom de l'hôtel"
          />
        </div>

        <div className="mb-4">
          <label className="block text-green-900 mb-1">Ville</label>
          <input
            name="ville"
            value={hotel.ville}
            onChange={handleChange}
            required
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
            placeholder="Ville"
          />
        </div>

        <div className="mb-4">
          <label className="block text-green-900 mb-1">Adresse</label>
          <input
            name="adresse"
            value={hotel.adresse}
            onChange={handleChange}
            required
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
            placeholder="Adresse"
          />
        </div>

        <div className="mb-6">
          <label className="block text-green-900 mb-1">Prix (MAD)</label>
          <input
            name="prix"
            type="number"
            value={hotel.prix}
            onChange={handleChange}
            required
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-green-500"
            placeholder="Prix"
          />
        </div>

        <button
          type="submit"
          className="w-full bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-4 rounded-md transition"
        >
          Ajouter l'hôtel
        </button>
      </form>
    </div>
  );
}
