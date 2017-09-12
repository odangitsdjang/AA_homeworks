import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

function applyMiddlewares(store, ...middlewares) {
  let dispatch = store.dispatch;
  middlewares.forEach(middleware=> {
     dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
}

//
// function addLoggingToDispatch(store) {
//   let something = store.dispatch;
//   return (action) => {
//     // old state
//     console.log( store.getState() );
//     console.log( action );
//     something(action);
//     // new state
//     console.log( store.getState() );
//   };
// }
