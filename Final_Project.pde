//All images used in this program
PImage currentImage1;
PImage currentImage2;
PImage currentImageStop;
PImage currentImageCloud;

//The background of the program X and Y 
int PictureX1;
int PictureY1;

//The Stick Man X and Y Location
int PictureX2=100;
int PictureY2=780;
 
//The Stop Light X and Y Location
int StopX= 820;
int StopY= 480;

//The red light X and Y Location
int RedX=1015;
int RedY=505;

//The yellow light X and Y Location
int YellowX=1015; 
int YellowY=542;

//The green light X and Y Location
int GreenX=1015;
int GreenY=580;

//The cloud X and Y Location
int CloudX=30;
int CloudY=-30;

//The text (Crossing Road 5000) X and Y location
int textX=330;
int textY=200;

//The text (Crossing Road 5000) Sizes
int textXsize=800;
int textYsize=100;

//The transparency of the text and the stroke of(Crossing Road 5000)
int trans;
//The transparency of the rect
int transTextBox;

//All of the boolean varriables
//The (no Loop) boolean
boolean a = false;

//The stick man moving right and left varriable
boolean StickmanMoving = false;

//The cloud moving right boolean
boolean cloudMove=false;

//The cloud moving right boolean reset
boolean resetCloud=false;

//The Button that makes the difficulties appear(Slow, Meduim, Fast)
boolean SpawnSpeeds=false;
//The text inside the box that says (Spawn Speeds)
boolean SpawnText=false;
//The boolean that stops the (Crossing Road 5000) text and rect
boolean fadeText=false;

//The button for (Easy)
boolean Easy=false;
//The button for (Medium)
boolean Medium=false;
//The button for (Hard)
boolean Hard=false;

//The button that resets the game
boolean reset=false;

//The different speeds(Slow,Medium,Fast)
boolean StickmanMovingSlow=false;
boolean StickmanMovingMedium=false;
boolean StickmanMovingFast=false;




void setup()
{
  //How smooth the game is
  smooth(4);
  //The frames that the game supports
  frameRate(244);
  //Screen Size
  size(1500, 1000);
  //The size of the  text
  textSize(20);
  //The rectMode is set to (CORNER)
  rectMode(CORNER);
  //The varriable for the transparency of the text and stroke
  trans = 255;
  //The varriable for the transparency of the rect
  transTextBox =255;
  //The Images variable is set to load the files that are stored in the Final_Project folder
  currentImage1 = loadImage("Buildings.png");
  currentImage2 = loadImage("Stick Man.png");
  currentImageStop = loadImage("Stop.png");
  currentImageCloud = loadImage("Cloud.png");
}


void draw()
{ 
  //The varriable (a) is set to false meaning there is no Loop
  if (a)
  {
    noLoop();
  }
  //The background is set to white
  background(255);

  //The X, Y and the size of the Buildings image
  image(currentImage1, PictureX1, PictureY1, 1500, 1000);
  //The X, Y and the size of the Stop light image
  image(currentImageStop,StopX, StopY, 350, 350);
  //The X, Y and the size of the Stick Man image
  image(currentImage2, PictureX2, PictureY2, 150, 150);
  //The X, Y and the size of the Cloud image
  image(currentImageCloud, CloudX, CloudY, 220, 150);
  
  //The gray lights(when the light aren't active
  fill(134,136,138);
  ellipse(RedX,RedY,30,30);
  fill(134,136,138);
  ellipse(YellowX,YellowY,30,30);
  fill(134,136,138);;
  ellipse(GreenX,GreenY,30,30);
  
  //Make fadeText true if PictureX2 >100 
  if(PictureX2 >100)
  {
    fadeText=true; 
  }
  //The if statement for making the transparency less 
  if(PictureX2 >400)
  {
    trans= trans-10;
    transTextBox = trans-10;
  }
  //The if statement for making (Crossing Road 5000) appearing
  if(fadeText==true)
  {
    stroke(0,0,0,trans);
    textSize(75);
    fill(255,255,255,transTextBox);
    rect(textX,textY,800,100);
    fill(0,0,0,trans);
    text("Crossing Road 5000",350,270);
  }
  //The if statement for making the Stick man move left  
  if (StickmanMoving ==true)
  {
    PictureX2 += -2;
  }
  
  //The if statement for making the Stick man move Right  
  if (StickmanMoving ==false)
  { 
    PictureX2 += 2;
  }
  
  //The if statement for making the Stick man move slow  
  if (StickmanMovingSlow ==true)
  {
    PictureX2 += 1;
  }
  //The if statement for making the Stick man move medium  
  if (StickmanMovingMedium ==true)
  {
    PictureX2 += 3;
  }
  //The if statement for making the Stick man move fast 
  if (StickmanMovingFast ==true)
  {
    PictureX2 += 7;
  }
  //The if statement for making the cloud move right 
  if (cloudMove ==true)
  {
    CloudX += 3;
  }
  //The if statement for making the cloud reset locations 
  if (resetCloud == true)
  {
    CloudX= 30; 
  }
  //If the Stick Man goes over 100X the cloud starts to move
  if(PictureX2 > 100)
  {
    cloudMove=true;
  }
  //The reset cloud code
  if(CloudX > 1500)
  {
    image(currentImageCloud, CloudX, CloudY, 220, 150);
    CloudX= 0;
    CloudY=-30;
  }
  //The Spawn text appears
  if( PictureX2 > 930)
  {
    SpawnText=true;
  }
  //The Spawn text disappears
  if( PictureX2 >980)
  {
    SpawnText=false;
  }
  //The Spawn text if true make the button appear
  if(SpawnText== true)
  {
    textSize(40);
    fill(0,0,255);
    rect(590,700,300,70);
    fill(0);
    text("Spawn Speeds",600,750);
  }
  //Makes the stick man stay at 950X
  if(PictureX2 > 950)
  { 
    PictureX2=950;
  }
  //The different speeds for the stick man if statement
  if(SpawnSpeeds== true)
  {
    fill(0,255,0);
    rect(200,210,300,70);
    fill(0);
    text("Slow",300,260);
    
    
    fill(255,244,79);
    rect(590,210,300,70);
    fill(0);
    text("Medium",665,260);
    
    
    fill(255,0,0);
    rect(1000,210,300,70);
    fill(0);
    text("Fast",1105,260);
   
    //Reset the game text and box
    textSize(45);
    fill(134,136,138);
    rect(550,400,400,70);
    fill(0);
    text("RESET THE GAME",565,450);
  }
  
  //If Easy true make the (Medium and Fast speeds disabled)
  if ( Easy== true)
  {
    SpawnSpeeds= false;
    PictureX2=100;
    SpawnText=false;
    PictureX2 += 1;
    a=false;
    StickmanMovingSlow=true;
    StickmanMovingMedium=false;
    StickmanMovingFast=false;
    fadeText=false;
  }
  //If Medium true make the (Slow and Fast speeds disabled)
   if ( Medium== true)
  {
    SpawnSpeeds= false;
    PictureX2=100;
    SpawnText=false;
    PictureX2 += 1;
    a=false;
    StickmanMovingMedium=true;
    StickmanMovingSlow=false;
    StickmanMovingFast=false;
    fadeText=false;
  }
  //If Fast true make the (Slow and Medium speeds disabled)
   if ( Hard== true)
  {
    SpawnSpeeds= false;
    PictureX2=100;
    SpawnText=false;
    PictureX2 += 1;
    a=false;
    StickmanMovingFast=true;
    StickmanMovingMedium=false;
    StickmanMovingSlow=false;
    fadeText=false;
  }
  //The reset button if statement
  if ( reset== true)
  {
    SpawnSpeeds= false;
    PictureX2=250;
    SpawnText=false;
    PictureX2 += 1;
    a=false;
    cloudMove=true;
    StickmanMovingMedium=false;
    StickmanMovingSlow=false;
    StickmanMovingFast=false;
  }
  
  //If the stick is at 100X make reset, Easy, Medium, Hard to false
  if(PictureX2 >100)
  {
    reset=false;
    Easy=false;
    Medium=false;
    Hard=false;
  }
  
  //If Stick man reaches 370 make the light red
  if(PictureX2 < 370)
  {
    fill(255,0,0);
    ellipse(RedX,RedY,30,30);
  }
  
  //If Stick man reaches 310 make the light red
  if(PictureX2 > 310)
  {
    fill(134,136,138);
    ellipse(RedX,RedY,30,30);
  }
  
  //If Stick man reaches 920 make the light red
  if(PictureX2 > 920)
  {
    fill(255,0,0);
    ellipse(RedX,RedY,30,30);
  }
  
  //If Stick man reaches 420 make the light green 
  if(PictureX2 > 420)
  {
    fill(0,255,0);
    ellipse(GreenX,GreenY,30,30);
  }
  
  //If Stick man reaches 740 make the light green 
  if(PictureX2 > 740)
  {
    fill(134,136,138);
    ellipse(GreenX,GreenY,30,30);
  } 
  
  //If Stick man reaches 320 make the light yellow 
  if(PictureX2 > 320)
  {
    fill(255,244,79);
    ellipse(YellowX,YellowY,30,30);
  }   
  //If Stick man reaches 400 make the light yellow 
  if(PictureX2 > 400)
  {
    fill(134,136,138);
    ellipse(YellowX,YellowY,30,30);
  }   
  
  //If Stick man reaches 750 make the light yellow 
  if(PictureX2 > 750)
  {
    fill(255,244,79);
    ellipse(YellowX,YellowY,30,30);
  }   
   
  //If Stick man reaches 900 make the light yellow 
  if(PictureX2 > 900)
  {
    fill(134,136,138);
    ellipse(YellowX,YellowY,30,30);
  } 
}

void keyPressed()
{
  //If (a) pressed make Stick man go left  
  if (key == 'a' || key == 'A')
  {
    StickmanMoving = true;  
  }
  
  //If (a) pressed make Stick man go right
  else if (key == 'd' || key == 'D')
  {
    StickmanMoving = false;
  }
}
  
void mouseClicked() 
{
  //The location of the hitbox of the reset button for the(Spawn Speeds)
  if(mouseX > 635 && mouseX < 835 && mouseY > 700 && mouseY < 750)
  {
    SpawnSpeeds=true;
  }
  
  //The location of the hitbox of the reset button for the(Reset cloud)
  if(mouseX > 550 && mouseX < 750 && mouseY > 400 && mouseY < 470)
  {
    resetCloud = true;
  }
  
  //The location of the hitbox of the reset button for the(Easy)
  if(mouseX > 200 && mouseX < 500 && mouseY > 210 && mouseY < 280)
  {
    Easy=true;
  }
  
  //The location of the hitbox of the reset button for the(Medium)
  if(mouseX > 590 && mouseX < 890 && mouseY > 210 && mouseY < 280)
  {
    Medium=true;
  }
  
  //The location of the hitbox of the reset button for the(Hard)
  if(mouseX > 1000 && mouseX < 1300 && mouseY > 210 && mouseY < 280)
  {
    Hard=true;
  }
  
  //The location of the hitbox of the reset button for the(Reset)
  if(mouseX > 550 && mouseX < 950 && mouseY > 400 && mouseY < 470)
  {
    reset =true;
  }
}

/**

1) My four (or more) text, images, and/or shapes are ; the Stick man.png, the stop light.png, cloud.png, the reset button, the select speeds 
and the slow, medium and fast buttons.

2) My one self-taught animation is fading text and button and i got the idea of doing by watching this tutorial 
https://funprogramming.org/25-Typing-big-letters-that-fade-out.html. Aryan also helped me in making my text fade and diappear. 

3) My four animations that were not learned from online tutorials are; the stick man walking left and right. The cloud moving right and reseting
when it reaches the top right corner of the screen. The light turning red, green, and yellow when the Stick man reaches the designated location.
The Button fading and the buttons making the stick man slow, medium, and fast.

4) When you press the (a) key on the keyboard, the stick man moves to the left and when you press the (d) key on the keyboard the stick man moves to the right. 
When the "Spwan Different Speeds" button is pressed all of the different speeds appear. When the (slow) button is pressed the stick man's speed decreases.
When the (medium) button is pressed the speed goes up by a bit. Lasty when the (fast) button is pressed the stick man's speed increases by alot.

*/

  
  
