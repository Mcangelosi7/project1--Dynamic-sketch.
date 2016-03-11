// Project 1, Dynamic Sketch
// by: Mike Cangelosi, 2016

 float tofuX = 80;
 float tofuY = 300;
 float goldX;
 float goldY;
 float sunX = 25;
 float sunY = 50;
 float cloudX = 25;
 float cloudY = 55;
 float skyB = 255;
 float hasGold = 0;
  
void setup(){
  size(800,600);
  float horizon = height/3;
}

void draw(){
  background(25,25,skyB);
  
  sun();
  cloud();
  ground();
  house();
  tree();
  tofu();
  gold();
  write();
}


// draw sun, have it move to the side of the screen, then come back
void sun(){
  

  
  fill(255,255,115);
  ellipse(sunX,sunY,50,50);
  sunX += 1.25;
  if(sunX >= width+25){
    sunX = -45;
    sunY = random(25,(height/3));
    skyB = 255 - sunY;
  }
}

//draw the ground at the horizon
void ground(){
   float horizon = height/3;
  fill(60,175,80);
  rect(0,horizon,width,(height-horizon));
}

void house(){
  
  //Draw red house
  fill(230,50,50);
  rect((width/3),(height/3)-50,150,90);
  
  //draw brown roof
  fill(145,70,70);
  triangle((width/3)-10,(height/3)-50,(width/3)+75,(height/3)-110,(width/3)+160,(height/3)-50);
  
  //draw brown door
  rect((width/3)+65,(height/3),30,40);
}
// Draw the tree
void tree(){
  float horizon = height/3;
  rect((width)-(width/4), horizon+20, 30,-100);
// Draw the leaves of the tree
  fill(45,165,45);
  ellipse((width)-(width/4)+20, horizon-80, 75,30);
    ellipse((width)-(width/4)+40, horizon-65, 75,30);
      ellipse((width)-(width/4)-10, horizon-65, 75,30);
}

void tofu(){

//Outside of ears
  fill(255,125,0);
  ellipse(tofuX-25,tofuY-40,40,40);
  ellipse(tofuX+25,tofuY-40,40,40);

//inside of ears
  fill(250,172,172);
  ellipse(tofuX-25,tofuY-40,25,25);
  ellipse(tofuX+25,tofuY-40,25,25);

//body
  fill(255,125,0);
  ellipse(tofuX,tofuY, 80,90);

//belly
  fill(245,233,225);
  ellipse(tofuX,tofuY+20,45,50);

//eyes
  fill(115,159,235);
  ellipse(tofuX-10,tofuY-28,10,15);
  ellipse(tofuX+10,tofuY-28,10,15);
  
//nose
  fill(250,150,150);
  ellipse(tofuX,tofuY-15,10,10);
    

//Feet
  fill(250,150,150);
  ellipse(tofuX-23,tofuY+45,40,15);
  ellipse(tofuX+23,tofuY+45,40,15);

//hands
  //If his hands are around the gold, hide the hands on his body.
  if (hasGold == 255){
    noStroke();
  }
  //Draw hands
  fill(255,125,0,(255-hasGold));
  ellipse(tofuX-23,tofuY+5,20,20);
  ellipse(tofuX+23,tofuY+5,20,20);
    stroke(0);
  
  // Make a heart when Tofu has the gold
  if (hasGold == 255){
    
    noStroke();
    fill(255,0,0);
    beginShape();
    vertex(tofuX+50, tofuY+15); 
    bezierVertex(tofuX+50, tofuY-5, tofuX+90,tofuY+5, tofuX+50, tofuY+40); 
    vertex(tofuX+50, tofuY+15); 
    bezierVertex(tofuX+50, tofuY-5, tofuX+10, tofuY+5, tofuX+50, tofuY+40); 
    endShape();
  }
  stroke(0);
 // Make Tofu follow the gold. 
  tofuX = tofuX + ( goldX - tofuX ) /30;
  tofuY = tofuY + ( goldY - tofuY ) /30;

}

//draw gold at the mouse cursor
void gold(){
  goldX = mouseX;
  if(mouseY >= height/3){
    goldY=mouseY;
  } else{
    goldY = (height/3);}
    
//Draw the gold
  fill(215,205,75);
  ellipse(goldX,goldY, 40,20);
  
//Check to see if Tofu is close to the gold.
   if (dist(tofuX,tofuY,goldX,goldY) <= 50){
    hasGold = 255;
    stroke(0);
  }else{
    hasGold = 0;
    noStroke();
  }
 //If he is: Draw hands around the gold.
  fill(255,125,0,hasGold);
  ellipse(goldX-23,goldY+5,20,20);
  ellipse(goldX+23,goldY+5,20,20);
  stroke(0);
  
 
  
}

//Draw a cloud. 
  void cloud(){


    fill(100,100,100,245);
    ellipse(cloudX,cloudY,100,35);
    ellipse(cloudX-35,cloudY+25,100,35);
    ellipse(cloudX+35,cloudY+25,100,35);
   
    //Have the cloud move across the sky, once it hits the edge; reset.
    cloudX = cloudX-1;
    if(cloudX<=.25){
      cloudX=width;
    }
  }
  
  //Display Title and author
 void write(){
    textSize(24);
    fill(0);
    text("Project 1, Tofu wants his gold." ,0 ,45);
    text("By: Mike Cangelosi, 2016",0,height-15);

}
  
  
