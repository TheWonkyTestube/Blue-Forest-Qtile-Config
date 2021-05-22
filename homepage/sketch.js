let canvas;
let dotNumber=600;
let pixelsPerDot=10;
let dots=[];

function windowResized(){
  resizeCanvas(windowWidth, windowHeight);
}

function setup() {
  canvas=createCanvas(windowWidth, windowHeight);
  canvas.position(0,0)
  canvas.style('z-index', '-1')
  for(let i=0;i<dotNumber;i++){
    let x=random(0,windowWidth)
    let y=random(0,windowHeight)
    let dx=random(-1,1)
    let dy=random(-1,1)
    let r=random(0,15)
    let c1=int(random(0,44))
    let c2=int(random(17,110))
    let c3=int(random(42,123))
    append(dots,new dot(x,y,dx,dy,r,c1,c2,c3))
  }
}

function draw(){
  background(27,31,59);
  for(let i=0; i<dotNumber-1; i++){
    fill(dots[i].c1,dots[i].c2,dots[i].c3);
    stroke(dots[i].c1,dots[i].c2,dots[i].c3);
    ellipse(dots[i].x,dots[i].y,dots[i].r);
    dots[i].move();
    if(dots[i].x<0 ||dots[i].x>windowWidth ||dots[i].y<0 ||dots[i].y>windowHeight){
      let x=random(0,windowWidth);
      let y=random(0,windowHeight);
      let dx=random(-1,1);
      let dy=random(-1,1);
      let r =random(0,15);
      let c1=int(random(0,44))
      let c2=int(random(17,110))
      let c3=int(random(42,123))
      temppoint= new dot(x,y,dx,dy,r,c1,c2,c3);
      dots[i]=temppoint;
    }
  }

  while(dots.length<100){
    let x=random(0,windowWidth)
    let y=random(0,windowHeight)
    let dx=random(-3,3)
    let dy=random(-3,3)
    let r=random(0,15)
    let c1=int(random(0,44))
    let c2=int(random(17,110))
    let c3=int(random(42,123))
    append(dots,new dot(x,y,dx,dy,r,c1,c2,c3))
    console.log('Added New')
  }
}

class dot{

  constructor(x, y, dx, dy, r,c1,c2,c3){
    this.x=x;
    this.y=y;
    this.dx=dx;
    this.dy=dy;
    this.r=r;
    this.c1=c1;
    this.c2=c2;
    this.c3=c3;
  }

  move() {
    this.x+=this.dx;
    this.y+=this.dy;
  }
}
