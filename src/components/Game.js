import React, { useState, useEffect } from 'react';
import Next from './Next';
import Score from './Score';
import Level from './Level';
import { createMatrix } from '../helpers/Helpers';
import styles from './Game.module.css';
import { emtpyPiece } from '../tetris/Piece';
import client from '../db'; // Importez la configuration de la base de données

export const Game = (props) => {
  const tetris = props.tetris;
  const [state, setState] = useState(props.tetris.state);
  const [error, setError] = useState(null);

  const onStateChange = (_state) => {
    setState(_state);

    // Sauvegardez le score uniquement lorsque le jeu est en pause ou terminé
    if (!_state.isRunning() && _state.score() > 0) {
      client.query('INSERT INTO scores (value) VALUES ($1)', [_state.score()])
        .then(() => {
          console.log('Score saved to database');
          setError(null); // Réinitialiser l'erreur
        })
        .catch(err => {
          console.error('Error saving score:', err);
          setError('Failed to save score. Please try again.'); // Afficher l'erreur
        });
    }
  };

  useEffect(() => {
    tetris.onStateChange(onStateChange);
    document.title = "React Tetris";
  }, [tetris]);

  let resumePauseButton;
  if (state.isStarted()) {
    if (state.isRunning()) {
      resumePauseButton =
        <button onClick={tetris.pause} className={`${styles.btn} ${styles.btnPause}`}>Pause</button>
    } else {
      resumePauseButton =
        <button onClick={tetris.resume} className={`${styles.btn} ${styles.btnNew}`}>Resume</button>
    }
  }

  const matrix = createMatrix(state.visibleMatrix(), styles);

  const nextPiece = state.nextPiece();
  const visibleNextPiece = nextPiece ? nextPiece : emtpyPiece();

  const gameOver = state.isGameOver() ?
    <div className={styles.gameOver}>
      <p>Game Over</p>
    </div>
    :
    '';

  return (
    <div className={styles.content}>
      {error && <div className={styles.error}>{error}</div>}
      <div className={styles.header}><span>React Tetris</span></div>

      <div className={styles.matrix}>
        {matrix}
        {gameOver}
      </div>
      <div className={styles.controls}>
        <div className={styles.controlsNext}>
          <Next next={visibleNextPiece} />
        </div>
        <div className={styles.controlsScore}>
          <Score score={state.score()} />
        </div>
        <div className={styles.controlsLevel}>
          <Level level={state.level()}></Level>
        </div>
        <div className={styles.controlsButtons}>
          <div className={styles.row}>
            <button onClick={tetris.start} className={`${styles.btn} ${styles.btnNew}`}>New Game</button>
          </div>
          <div className={styles.row}>
            {resumePauseButton}
          </div>
        </div>
        <div className={styles.controlsInfo}>
          <p className="infoText">
            Start/Pause/Resume: Space <br />
            Rotate: Arrow Up <br />
            Left: Arrow Left <br />
            Right: Arrow Right <br />
            Soft Drop: Arrow Down <br />
          </p>
        </div>
      </div>
    </div>
  );
};

export default Game;