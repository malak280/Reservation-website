
require('dotenv').config();
const sql = require('mssql');


const sqlconfig = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_SERVER,
  database: process.env.DB_DATABASE,
  options: {
    encrypt: process.env.DB_ENCRYPT === 'true',               
    trustServerCertificate: process.env.DB_TRUST_CERT === 'true'  
  },
};


const poolPromise = new sql.ConnectionPool(sqlconfig)
  .connect()
  .then(pool => {
    console.log('✅ Connecté à la base SQL Server');
    return pool;
  })
  .catch(err => {
    console.log('❌ Erreur de connexion à la base:', err);
  });

module.exports = {
  sql,
  poolPromise,
};
/*
require('dotenv').config(); // charge les variables d'environnement
const sql = require('mssql');

// Configuration de la connexion en lisant depuis le fichier .env
const config = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_SERVER,
  database: process.env.DB_DATABASE,
  options: {
    encrypt: process.env.DB_ENCRYPT === 'true',
    trustServerCertificate: process.env.DB_TRUST_CERT === 'true'
  }
};

// Affiche les valeurs pour vérifier que .env est bien lu
console.log('🔍 Variables ENV chargées :', {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_SERVER,
  database: process.env.DB_DATABASE
});

// Test de la connexion
async function testConnection() {
  try {
    const pool = await sql.connect(config);
    console.log('✅ Connexion réussie à la base de données !');
    await pool.close();
  } catch (err) {
    console.error('❌ Erreur de connexion à la base :', err);
  }
}

testConnection();
*/