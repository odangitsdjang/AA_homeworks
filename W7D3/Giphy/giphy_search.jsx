import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './actions/giphy_actions';

const store = configureStore();

document.addEventListener('DOMContentLoaded', () => {
  window.store = store;
  // replace id root with Root
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
