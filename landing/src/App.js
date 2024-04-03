import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  // Initialize state for the countdown
  const [countdown, setCountdown] = useState(7 * 24 * 60 * 60 * 1000); // 7 days in milliseconds

  // Update the countdown every second
  useEffect(() => {
    const timer = setInterval(() => {
      setCountdown(prevCountdown => prevCountdown - 1000);
    }, 1000);

    // Clean up timer
    return () => clearInterval(timer);
  }, []);

  // Calculate days, hours, minutes, and seconds from milliseconds
  const days = Math.floor(countdown / (1000 * 60 * 60 * 24));
  const hours = Math.floor((countdown % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  const minutes = Math.floor((countdown % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((countdown % (1000 * 60)) / 1000);

  return (
    <div className="App">
      <h1>Welcome to my page</h1>
      <div className="Countdown">
        <p>Countdown: {days} days, {hours} hours, {minutes} minutes, {seconds} seconds</p>
      </div>
    </div>
  );
}

export default App;