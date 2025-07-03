import React, { useState } from 'react';
import axios from 'axios';

const ReservationForm = ({ hotelId }) => {
  const [form, setForm] = useState({
    nom_client: '',
    email_client: '',
    date_debut: '',
    date_fin: '',
    nb_personnes: 1,
  });

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post('http://localhost:5001/reservation', { ...form, id_hotel: hotelId });
      alert('Réservation réussie !');
    } catch (error) {
      console.error('Erreur lors de la réservation :', error);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <h3>Réserver</h3>
      <input name="nom_client" placeholder="Nom" onChange={handleChange} required />
      <input name="email_client" placeholder="Email" onChange={handleChange} />
      <input type="date" name="date_debut" onChange={handleChange} required />
      <input type="date" name="date_fin" onChange={handleChange} required />
      <input type="number" name="nb_personnes" min="1" onChange={handleChange} required />
      <button type="submit">Réserver</button>
    </form>
  );
};

export default ReservationForm;
