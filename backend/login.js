require('dotenv').config();
const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { sql, poolPromise } = require('./bd');

const router = express.Router();
const JWT_SECRET = process.env.JWT_SECRET;

// Route login - NOTER '/' et non '/login'
router.post('/', async (req, res) => {
  const { username, password } = req.body || {};
  if (!username || !password) return res.status(400).send('Username et password requis');

  try {
    const pool = await poolPromise;
    const result = await pool.request()
      .input('username', sql.NVarChar, username)
      .query('SELECT * FROM Utilisateurs WHERE username = @username');
    const user = result.recordset[0];
    if (!user) return res.status(401).send('Utilisateur non trouvé');

    const validPassword = await bcrypt.compare(password, user.password);
    if (!validPassword) return res.status(401).send('Mot de passe incorrect');

    const token = jwt.sign({ userId: user.id, username: user.username }, JWT_SECRET, { expiresIn: '1h' });
    res.json({ token });
  } catch (err) {
    console.error(err);
    res.status(500).send('Erreur serveur');
  }
});

module.exports = router;
