import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import LoginPage from './pages/loginpage';
import HomePage from './pages/acceil';
import HotelDetailsPage from './pages/hoteldetails';
import ReservationPage from './pages/reservation';
import Hotel from "./pages/hotel";



function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<LoginPage />} />
        <Route path="/hotel" element={<Hotel />} />
        <Route path="/hotel/:id" element={<HotelDetailsPage />} />
        <Route path="/reservation" element={<ReservationPage />} />
      </Routes>
    </Router>
  );
}

export default App;
