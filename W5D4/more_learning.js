// .load more_learning.js
//
// Write a function that takes three strings - a verb, an adjective, and a noun -
// uppercases and interpolates them into the sentence
// "We shall VERB the ADJECTIVE NOUN". Use ES6 template literals.
var madLib = function(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`;
};

var isSubString = function(searchString, subString) {
  return (searchString.includes(subString));
};

var fizzBuzz = function(arr) {
  return (arr.filter(el=> ((el%3===0) || (el%5===0))));
};

var isPrime = function(num) {
  if (num < 2) { return false; }
  for (let i = 2; i < num; i++) {
    if (num%i === 0) {
      return false;
    }
  }
  return true;
};

var sumOfNPrimes = function(count) {
  var arr = [];
  var i = 0;
  while (arr.length < count) {
    if (isPrime(i)) {
      arr.push(i);
    }
    i++;
  }
  return arr.reduce((acc, el) => acc+el);
};
