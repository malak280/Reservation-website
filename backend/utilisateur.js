const express = require('express');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const router = express.Router();

const JWT_SECRET = 'ta_clef_secrete_super_securisee';

// Stockage temporaire "en mémoire" des utilisateurs
const users = [];

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

// Route d'inscription
router.post('/register', async (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) return res.status(400).send('Champs manquants');
  if (users.find(u => u.username === username)) return res.status(400).send('Utilisateur déjà existant');

  const hash = await bcrypt.hash(password, 10);
  users.push({ id: users.length + 1, username, password: hash });
  res.status(201).send('Utilisateur créé (en mémoire)');
});

// Route login qui retourne un JWT
router.post('/login', async (req, res) => {
  const { username, password } = req.body;
  const user = users.find(u => u.username === username);
  if (!user) return res.status(401).send('Utilisateur non trouvé');

  const validPassword = await bcrypt.compare(password, user.password);
  if (!validPassword) return res.status(401).send('Mot de passe incorrect');

  const token = jwt.sign({ userId: user.id, username: user.username }, JWT_SECRET, { expiresIn: '1h' });
  res.json({ token });
});

// Route protégée exemple
router.get('/profile', authenticateToken, (req, res) => {
  res.json({ message: `Bienvenue ${req.user.username}`, user: req.user });
});

// Exports
router.authenticateToken = authenticateToken;
module.exports = router;
