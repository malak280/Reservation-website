const express = require('express');
const router = express.Router();
const { sql, poolPromise } = require('./bd');
const jwt = require('jsonwebtoken');

const JWT_SECRET = 'ta_clef_secrete_super_securisee';

// Middleware pour vérifier JWT
function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  if (!token) return res.status(401).send('Token manquant');

  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) return res.status(403).send('Token invalide');
    req.user = user;
    next();
  });
}

// Créer une réservation
router.post('/reservation', authenticateToken, async (req, res) => {
  const { hotel_id, date_debut, date_fin, nombre_personnes } = req.body;
  const utilisateur_id = req.user.userId;

  if (!hotel_id || !date_debut || !date_fin || !nombre_personnes) {
    return res.status(400).send('Champs manquants');
  }

  try {
    await sql.connect(config);
    await new sql.Request()
      .input('utilisateur_id', sql.Int, utilisateur_id)
      .input('hotel_id', sql.Int, hotel_id)
      .input('date_debut', sql.Date, date_debut)
      .input('date_fin', sql.Date, date_fin)
      .input('nombre_personnes', sql.Int, nombre_personnes)
      .query(`INSERT INTO Reservations (utilisateur_id, hotel_id, date_debut, date_fin, nombre_personnes)
              VALUES (@utilisateur_id, @hotel_id, @date_debut, @date_fin, @nombre_personnes)`);

    res.status(201).send('Réservation créée');
  } catch (err) {
    console.error(err);
    res.status(500).send('Erreur serveur');
  }
});

router.get('/mes-reservations', authenticateToken, async (req, res) => {
  const utilisateur_id = req.user.userId;

  try {
    await sql.connect(config);
    const result = await sql.query`
      SELECT R.*, H.nom AS hotel_nom 
      FROM Reservations R 
      JOIN Hotels H ON R.hotel_id = H.id 
      WHERE R.utilisateur_id = ${utilisateur_id}`;
    
    res.json(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).send('Erreur serveur');
  }
});

router.delete('/reservation/:id', authenticateToken, async (req, res) => {
  const { id } = req.params;
  const utilisateur_id = req.user.userId;

  try {
    await sql.connect(config);
    await sql.query`
      DELETE FROM Reservations WHERE id = ${id} AND utilisateur_id = ${utilisateur_id}`;
    res.send('Réservation supprimée');
  } catch (err) {
    console.error(err);
    res.status(500).send('Erreur serveur');
  }
});


module.exports = router;
