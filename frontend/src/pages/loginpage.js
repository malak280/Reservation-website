import React, { useState } from 'react';
import axios from 'axios';


function LoginPage() {
  const [isSignup, setIsSignup] = useState(false);
  const [email, setEmail] = useState('');
  const [motdepasse, setMotdepasse] = useState('');
  const [nom, setNom] = useState(''); // uniquement pour inscription
  const [erreur, setErreur] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (isSignup) {
      // Inscription
      try {
        await axios.post('http://localhost:5001/register', { nom, email, motdepasse });
        alert("Compte créé avec succès, vous pouvez maintenant vous connecter");
        setIsSignup(false);
        setNom('');
        setEmail('');
        setMotdepasse('');
        setErreur('');
      } catch (err) {
        setErreur("Erreur lors de l'inscription");
      }
    } else {
      // Connexion
      try {
        const res = await axios.post('http://localhost:5001/login', { email, motdepasse });
        localStorage.setItem('token', res.data.token);
        alert("Connexion réussie");
      } catch (err) {
        setErreur("Email ou mot de passe incorrect");
      }
    }
  };

  return (
    <div style={{ padding: '2rem', maxWidth: '400px', margin: 'auto' }}>
      <h2>{isSignup ? "Créer un compte" : "Connexion"}</h2>
      {erreur && <p style={{ color: 'red' }}>{erreur}</p>}
      <form onSubmit={handleSubmit}>
        {isSignup && (
          <input
            type="text"
            placeholder="Nom"
            value={nom}
            onChange={(e) => setNom(e.target.value)}
            required
          />
        )}
        <input
          type="email"
          placeholder="Email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <input
          type="password"
          placeholder="Mot de passe"
          value={motdepasse}
          onChange={(e) => setMotdepasse(e.target.value)}
          required
        />
        <button type="submit">{isSignup ? "S'inscrire" : "Se connecter"}</button>
      </form>
      <p style={{ marginTop: '1rem' }}>
        {isSignup ? "Vous avez déjà un compte ?" : "Vous n'avez pas encore de compte ?"}{" "}
        <button type="button" onClick={() => setIsSignup(!isSignup)} style={{ color: 'blue', border: 'none', background: 'none', cursor: 'pointer' }}>
          {isSignup ? "Se connecter" : "Créer un compte"}
        </button>
      </p>
    </div>
  );
}

export default LoginPage;
