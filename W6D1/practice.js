document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('myCanvas');
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(200,0,0)';
  ctx.fillRect(100,100,500,500);

  // circle
  ctx.beginPath();
  ctx.arc(125, 125, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "green";
  ctx.lineWidth = 15;
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();


});
