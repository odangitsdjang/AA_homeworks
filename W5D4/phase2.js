// .load phase2.js

var titleize = function(arr, callback) {
  var capitalized = arr.map(name=>`Mx. ${name} Jingleheimer Schmidt`);
  callback(capitalized);
};

var callback = function(names) {
  return names.forEach(name=>console.log(name));
};
