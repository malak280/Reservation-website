/*
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import filtrehotel from ".components/filtrehotel";
import AddHotel from ".components/hotel";

const Hotel = () => {
  const [hotel, setHotel] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:5001/hotel')
      .then(response => {
         console.log('Réponse API :', response.data);
        setHotel(response.data);
      })
      .catch(error => {
        console.error('Erreur lors du chargement des hôtels :', error);
      });
  }, []);

  return (
    <div style={{ padding: '2rem' }}>
      <h1>Liste des Hôtels</h1>
      <table border="1" cellPadding="10" cellSpacing="0">
        <thead>
          <tr>
            <th>Nom</th>
            <th>Ville</th>
            <th>Adresse</th>
            <th>Prix (MAD)</th>
          </tr>
        </thead>
        <tbody>
          {hotel.map((hotel) => (
            <tr key={hotel.id}>
              <td>{hotel.nom}</td>
              <td>{hotel.ville}</td>
              <td>{hotel.adresse}</td>
              <td>{hotel.prix}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Hotel;
*/import React, { useEffect, useState } from 'react';
import axios from 'axios';

// Composant de filtre
const FiltreHotel = ({ onFilter }) => {
  const [ville, setVille] = useState('');
  const [dateDebut, setDateDebut] = useState('');
  const [dateFin, setDateFin] = useState('');
  const [personnes, setPersonnes] = useState(1);

  const handleSubmit = (e) => {
    e.preventDefault();
    onFilter({ ville, dateDebut, dateFin, personnes });
  };

  return (
    <form onSubmit={handleSubmit} style={{ marginBottom: '2rem' }}>
      <input type="text" placeholder="Ville" value={ville} onChange={(e) => setVille(e.target.value)} />
      <input type="date" value={dateDebut} onChange={(e) => setDateDebut(e.target.value)} />
      <input type="date" value={dateFin} onChange={(e) => setDateFin(e.target.value)} />
      <input type="number" placeholder="Personnes" value={personnes} onChange={(e) => setPersonnes(e.target.value)} min="1" />
      <button type="submit">Filtrer</button>
    </form>
  );
};

const Hotel = () => {
  const [hotels, setHotels] = useState([]);
  const [filteredHotels, setFilteredHotels] = useState([]);

  const fetchHotels = async () => {
    try {
      const response = await axios.get('http://localhost:5001/hotel');
      setHotels(response.data);
      setFilteredHotels(response.data); // initialise la liste filtrée avec tous les hôtels
    } catch (error) {
      console.error('Erreur lors du chargement des hôtels :', error);
    }
  };

  useEffect(() => {
    fetchHotels();
  }, []);

  const handleFilter = (filters) => {
    let results = hotels;

    if (filters.ville) {
      results = results.filter(h => h.ville.toLowerCase().includes(filters.ville.toLowerCase()));
    }

    // Ici tu peux ajouter la gestion des filtres dateDebut, dateFin, personnes
    // selon ta logique métier et ta base de données

    setFilteredHotels(results);
  };

  return (
    <div style={{ padding: '2rem' }}>
      <h1>Liste des Hôtels</h1>

      <FiltreHotel onFilter={handleFilter} />

      <table border="1" cellPadding="10" cellSpacing="0">
        <thead>
          <tr>
            <th>Nom</th>
            <th>Ville</th>
            <th>Adresse</th>
            <th>Prix (MAD)</th>
          </tr>
        </thead>
        <tbody>
          {filteredHotels.map((hotel) => (
            <tr key={hotel.id}>
              <td>{hotel.nom}</td>
              <td>{hotel.ville}</td>
              <td>{hotel.adresse}</td>
              <td>{hotel.prix}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Hotel;
