const express = require('express');
const { sql, poolPromise } = require('./bd');
const authenticateToken = require('./auth');

const router = express.Router();

router.post('/register', async (req, res) => {
  const { nom, email, motdepasse } = req.body;
  try {
    const hashedPassword = await bcrypt.hash(motdepasse, 10);
    const pool = await poolPromise;

    await pool.request()
      .input('nom', sql.NVarChar, nom)
      .input('email', sql.NVarChar, email)
      .input('motdepasse', sql.NVarChar, hashedPassword)
      .query('INSERT INTO Utilisateurs (nom, email, motdepasse) VALUES (@nom, @email, @motdepasse)');

    res.status(201).send('Utilisateur enregistré');
  } catch (err) {
    console.error(err);
    res.status(500).send('Erreur lors de l\'enregistrement');
  }
});

module.exports = router;
