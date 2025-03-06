import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import Game from './components/Game';
import { createTetris } from './tetris/Tetris';
import client from './db'; // Importez la configuration de la base de données

const tetris = createTetris();
tetris.start();

// Testez la connexion à la base de données
client.query('SELECT 1')
  .then(() => console.log('Database connection successful!'))
  .catch(err => console.error('Database connection failed:', err));

document.addEventListener("keydown", (event) => {
  const keyName = event.key;
  if (tetris.isRunning()) {
    if (keyName === "ArrowUp") {
      tetris.rotateCurrentPiece();
    } else if (keyName === "ArrowDown") {
      tetris.tick();
    } else if (keyName === "ArrowLeft") {
      tetris.moveLeft();
    } else if (keyName === "ArrowRight") {
      tetris.moveRight();
    } else if (keyName === " ") {
      tetris.pause();
    }
  } else {
    if (keyName === " ") {
      if (tetris.isPaused()) {
        tetris.resume();
      } else {
        tetris.start();
      }
    }
  }
});

ReactDOM.render(
  <React.StrictMode>
    <Game tetris={tetris} />
  </React.StrictMode>,
  document.getElementById('root')
);