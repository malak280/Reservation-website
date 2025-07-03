require('dotenv').config();
const express = require('express');
const cors = require('cors');
const jwt = require('jsonwebtoken');
const path = require('path');



const app = express();
app.use(express.json());
app.use(cors());

const JWT_SECRET = process.env.JWT_SECRET;

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

// Importer routes
const loginRouter = require('./login');
const registerRouter = require('./register');
const hotelRouter = require('./hotel');
const reservationRouter = require('./reservation');




app.use('/login', loginRouter);
app.use('/register', registerRouter);
app.use('/', hotelRouter);
app.use('/hotel', hotelRouter);
app.use('/reservation', authenticateToken, reservationRouter);

// Servir le frontend
app.use(express.static(path.join(__dirname, '../frontend')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend', 'acceuil.html')); 
});

app.listen(process.env.PORT || 5001, () => {
  console.log(`✅ Serveur lancé sur http://localhost:${process.env.PORT || 5001}`);

});
