# Projet : Site de Réservation d'Hôtels - OCP

## 👩‍💻 Développé par : Malak/RANIA 
## 📆 Année : 2025  
## 🏫 École : Polytech Nancy (IA2R)

---

## 📁 Contenu du projet

- `frontend/` → Contient les fichiers HTML/CSS/JS (interface utilisateur)
- `backend/` → Contient l’API Node.js/Express (serveur)
- `database/ReservationDB.sql` → Script SQL pour recréer la base de données dans SQL Server Management Studio (SSMS)

---

## 🔧 Instructions pour exécuter le projet

### 1. Installer la base de données

1. Ouvrir **SQL Server Management Studio (SSMS)**
2. Aller dans `File > Open > File` et ouvrir le fichier `ReservationDB.sql`
3. Exécuter le script pour créer la base `ReservationDB` et ses tables

### 2. Lancer le backend (Express.js)

```bash
cd backend
npm install
npm start
