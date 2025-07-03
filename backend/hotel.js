/*const express = require('express');
const { sql, poolPromise } = require('./bd');
const app = express();
const port = process.env.PORT;
const router = express.Router();

router.get('/hotel', async (req, res) => {
  try {
   const pool = await poolPromise;  // attends la connexion au pool
    const result = await pool.request().query('SELECT * FROM dbo.Hotels');
    res.json(result.recordset);
  } catch (err) {
    console.error('Erreur lors de la récupération des hôtels:', err);
    res.status(500).send('Erreur serveur');
  }
});
router.get('/hotel', async (req, res) => {
  const { adults, children, rooms } = req.query;

  console.log("Recherche avec paramètres :", adults, children, rooms);

  // Exemple de filtre simple (optionnel — adapte selon ta base)
  const totalGuests = parseInt(adults) + parseInt(children);

  try {
    const hotels = await pool.query(`
      SELECT * FROM dbo.Hotels
      WHERE capacite >= $1 AND chambres >= $2
    `, [totalGuests, rooms]);

    res.json(hotels.rows);
  } catch (error) {
    console.error(error);
    res.status(500).send('Erreur lors de la récupération des hôtels.');
  }
});

router.get('/', async (req, res) => {
  try {
   const pool = await poolPromise;  // attends la connexion au pool
    const result = await pool.request().query('SELECT * FROM dbo.Hotels');
    res.json(result.recordset);
  } catch (err) {
    console.error('Erreur lors de la récupération des hôtels:', err);
    res.status(500).send('Erreur serveur');
  }
});

router.get('/hotel/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const result = await sql.query`SELECT * FROM dbo.Hotels WHERE id = ${id}`;
    if (result.recordset.length === 0) {
      return res.status(404).send('Hôtel non trouvé');
    }
    res.json(result.recordset[0]);
  } catch (err) {
    console.error('Erreur lors de la récupération de l\'hôtel:', err);
    res.status(500).send('Erreur serveur');
  }
});

router.post('/hotel', async (req, res) => {
  try {
    const { nom, adresse, ville, prix, periodedispo, imageUrl } = req.body;

    const sql = `
      INSERT INTO dbo.Hotels (nom, adresse, ville, prix, periodedispo, imageUrl)
      VALUES (@nom, @adresse, @ville, @prix, @periodedispo, @imageUrl)
    `;

    const pool = await sqlServer.connect(config);
    const request = pool.request();
    request.input('nom', sqlServer.NVarChar, nom);
    request.input('adresse', sqlServer.NVarChar, adresse);
    request.input('ville', sqlServer.NVarChar, ville);
    request.input('prix', sqlServer.Int, prix);
    request.input('periodedispo', sqlServer.NVarChar, periodeDispo);
    request.input('imageUrl', sqlServer.NVarChar(sql.MAX), imageUrl);

    await request.query(sql);
    res.status(200).send('Hôtel ajouté avec succès');
  } catch (error) {
    console.error('Erreur lors de l’ajout de l’hôtel :', error);
    res.status(500).send('Erreur serveur');
  }
});

// Route pour récupérer les hôtels
router.get('/', async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('SELECT * FROM dbo.Hotels');
    res.json(result.recordset);
  } catch (err) {
    console.error('Erreur récupération hôtels :', err.message);
    res.status(500).send('Erreur serveur');
  }
});

module.exports = router;
*/
const express = require('express');
const { sql, poolPromise } = require('./bd');
const router = express.Router();

// ➤ GET tous les hôtels
router.get('/hotel', async (req, res) => {
  try {
    const pool = await poolPromise;
    const result = await pool.request().query('SELECT * FROM Hotels');
    res.json(result.recordset);
  } catch (err) {
    console.error('Erreur lors de la récupération des hôtels:', err.message);
    res.status(500).send('Erreur serveur');
  }
});

// ➤ GET un hôtel par ID
router.get('/hotel/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const pool = await poolPromise;
    const result = await pool.request()
      .input('id', sql.Int, id)
      .query('SELECT * FROM Hotels WHERE id = @id');

    if (result.recordset.length === 0) {
      return res.status(404).send('Hôtel non trouvé');
    }

    res.json(result.recordset[0]);
  } catch (err) {
    console.error('Erreur lors de la récupération de l\'hôtel:', err.message);
    res.status(500).send('Erreur serveur');
  }
});

// ➤ POST pour ajouter un hôtel manuellement
router.post('/hotel', async (req, res) => {
  const { nom, adresse, ville, prix, periodedispo, imageUrl } = req.body;

  try {
    const pool = await poolPromise;
    await pool.request()
      .input('nom', sql.NVarChar, nom)
      .input('adresse', sql.NVarChar, adresse)
      .input('ville', sql.NVarChar, ville)
      .input('prix', sql.Int, prix)
      .input('periodedispo', sql.NVarChar, periodedispo)
      .input('imageUrl', sql.NVarChar(sql.MAX), imageUrl)
      .query(`
        INSERT INTO Hotels (nom, adresse, ville, prix, periodedispo, imageUrl)
        VALUES (@nom, @adresse, @ville, @prix, @periodedispo, @imageUrl)
      `);

    res.status(200).send('Hôtel ajouté avec succès');
  } catch (error) {
    console.error('Erreur lors de l’ajout de l’hôtel :', error.message);
    res.status(500).send('Erreur serveur');
  }
});

module.exports = router;
