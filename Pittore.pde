/*
  * Pittore - Drawing Application
  * Made by Erick Sauri
  * February 4, 2015
  * Interactive Media Development
  * http://ericksauri.com
*/
PImage[] icons = new PImage[17];
color[] palette = new color[11];
int[] xCoords = new int[3]; //Array for most common xCoordinates
int[] yCoords = new int[3]; //Array for most common yCoordinates
int pSize = 60; //size of the squares
int saveCount; //save count for images
int drawMode = 0; //Variable for drawing mode AKA Line, Square or Circle
int alph;
int currentStroke; //Variable for the current Stroke Weight
int currentAlpha; //Variable for the current Alpha
color currentColor; //Variable for the current Color
int currentSize; //color for shape size

Square s; //Initialize the square


int grid; //Grid variable


void setup()
{
  size(960,570);
  background(255);

  /* Beginning of Color Array */
  palette[0] = color(239, 201, 76); //Yellow
  palette[1] = color(242, 155, 48); //Orange
  palette[2] = color(231, 76, 60); //Red
  palette[3] = color(70, 95, 63); //Green
  palette[4] = color(104, 92, 121); //Purple
  palette[5] = color(44, 62, 80); //Blue
  palette[6] = color(124, 128, 129); //Gray
  palette[7] = color(89, 71, 53); //Brown
  palette[8] = color(35, 31, 32); //Black
  palette[9] = color(236, 240, 241); //Panel White
  palette[10]= color(243, 246, 250); //Canvas White
  /* End of Color Array */

  /* Beginning of X Coordinates Array */
  xCoords[0] = 0;
  xCoords[1] = 60;
  xCoords[2] = 120;
  /* End of X Coordinates Array */

  /* Beginning of Y Coordinates Array */
  yCoords[0] = 60;
  yCoords[1] = 120;
  yCoords[2] = 180;
  /* End of Y Coordinates Array */

  /* Beginning of Icons Array */
  icons[0] = loadImage("icons/logo.png");
  icons[1] = loadImage("icons/line.png");
  icons[2] = loadImage("icons/square.png");
  icons[3] = loadImage("icons/circle.png");
  icons[4] = loadImage("icons/minus.png");
  icons[5] = loadImage("icons/plus.png");
  icons[6] = loadImage("icons/stroke.png");
  icons[7] = loadImage("icons/alpha.png");
  icons[8] = loadImage("icons/eraser.png");
  icons[9] = loadImage("icons/save.png");
  icons[10] = loadImage("icons/clear.png");
  icons[11] = loadImage("icons/mode.png");
  icons[12] = loadImage("icons/instructions.png");
  icons[13] = loadImage("icons/line2.png");
  icons[14] = loadImage("icons/square2.png");
  icons[15] = loadImage("icons/circle2.png");
  icons[16] = loadImage("icons/instructionButton.png");



  /* End of Icons Array */

  /* Give all "curent" variables a default value */
  currentStroke = 1;
  currentAlpha = 255;
  currentColor = palette[8];
  currentSize = 50;
  grid = 3;
  saveCount = 0;

  createCanvas(); //Create the canvas on which you draw
}

void draw()
{
  if (mouseX > 180 && mousePressed)
  {
    drawSomething();
  }

  createPanel();
  instructions();
  
}

void createCanvas()
{
  noStroke();  

  /*Canvas*/
  fill(palette[10]);
  rect(180, 0, width, height);
}

void createPanel()
{
  /* Sidebar */
  noStroke();
  fill(palette[9]);
  rect(0, 0, 180, height);

  displayPalette();
  displayIcons();
  displayMode();
}

void drawSomething()
{
  switch(drawMode) //Check which mode is active (Line, Square or Circle)
  {
  case 0: //Line is active    
    strokeWeight(currentStroke);
    stroke(currentColor,currentAlpha);
    line(pmouseX, pmouseY, mouseX, mouseY);
    
    break;

  case 1: //Square is active
    noStroke();
    s = new Square(mouseX, mouseY, currentSize, currentColor, currentAlpha);
    s.displaySquare();
    break;

  case 2: //Circle is active
    fill(currentColor,currentAlpha);
    strokeWeight(currentStroke);
    ellipse(mouseX, mouseY, currentSize, currentSize);
    break;
  }
}

/* Displays the palette in the sidebar from which we choose colors */
void displayPalette()
{
  int p = 0; //variable for number in the color array
  for (int r = 0; r < grid; r++)
  {      
    for (int c = 0; c < grid; c++)
    {        
      fill(palette[p]);

      rect(xCoords[c], yCoords[r], pSize, pSize);
      p++; //increase number each time so that we can get different colors
    }
  }
}

/* Display icons for Draw Mode (Line, Square, Circle), and others */
void displayIcons() 
{
  image(icons[0], xCoords[0], xCoords[0]);
  
  /* DrawMode Icons*/
  image(icons[11], xCoords[0],250); 

  for(int a = 0; a < grid; a++)
  {    
    image(icons[a+1],xCoords[a],290);
  }
 

  /* Stroke Icons */
  image(icons[4], 10, 370);
  image(icons[6],30,370);
  image(icons[5], 140, 370);
  
  /* Alpha Icons */
  image(icons[4], 10, 420);
  image(icons[7],30,420);
  image(icons[5], 140, 420);
  
  
  /*Eraser Icon, Save Icon, Clear Icon  */
  int c = 8;
  for(int b = 0; b < grid; b++)
  {  
    image(icons[c],xCoords[b],460);
    c++;
  }  
  
  image(icons[16], 10, 530);
}

void mousePressed() //AKA Pain in the ass
{
  /* Choosing Colors */
  
  if(mouseX < xCoords[1] && mouseY < yCoords[1] && mouseY > yCoords [0])
  {
    currentColor = palette[0];
  }
  else if(mouseX < xCoords[2] && mouseX > xCoords[1] && mouseY < yCoords[1] && mouseY > yCoords [0])
  {
    currentColor = palette[1];
  }
  else if(mouseX < 180 && mouseX > xCoords[2] && mouseY < yCoords[1] && mouseY > yCoords [0])
  {
    currentColor = palette[2];
  }
  
  else if(mouseX < xCoords[1] && mouseY < yCoords[2] && mouseY > yCoords [1])
  {
    currentColor = palette[3];
  }
  else if(mouseX < xCoords[2] && mouseX > xCoords[1] && mouseY < yCoords[2] && mouseY > yCoords [1])
  {
    currentColor = palette[4];
  }
  else if(mouseX < 180 && mouseX > xCoords[2] && mouseY < yCoords[2] && mouseY > yCoords [1])
  {
    currentColor = palette[5];
  }
  
  else if(mouseX < xCoords[1] && mouseY < 240 && mouseY > yCoords [2])
  {
    currentColor = palette[6];
  }
  else if(mouseX < xCoords[2] && mouseX > xCoords[1] && mouseY < 240 && mouseY > yCoords [2])
  {
    currentColor = palette[7];
  }
  else if(mouseX < 180 && mouseX > xCoords[2] && mouseY < 240 && mouseY > yCoords [2])
  {
    currentColor = palette[8];
  }
  
  /* DrawMode Conditions*/
  else if (mouseX < xCoords[1] && mouseX > xCoords[0] && mouseY > 290 && mouseY < 350)
  {
    drawMode = 0; //Line Mode
  } else if (mouseX < xCoords[2] && mouseX > xCoords[1] && mouseY > 290 && mouseY < 350)
  {
    drawMode = 1; //Square Mode
  } else if (mouseX < 180 && mouseX > xCoords[2] && mouseY > 290 && mouseY < 350)
  {
    drawMode = 2; //Circle Mode
  }
  /* Stroke and Size */
  else if (mouseX < 40 && mouseX > 10 && mouseY > 370 && mouseY < 400)
  {
    if(currentStroke > 10)
    {
      currentStroke-= 11;      
    }
    
    if(currentSize > 10)
    {
      currentSize-= 5;      
    }
  }
  else if (mouseX < 140 && mouseX >40 && mouseY > 370 && mouseY < 400)
  {
    currentStroke = 1;
    currentSize = 50;
  }
  else if (mouseX < 170 && mouseX >140 && mouseY > 370 && mouseY < 400)
  {
    currentStroke+= 10;
    currentSize += 5;
  }
  
  /* Alpha */
  else if (mouseX < 40 && mouseX > 10 && mouseY > 420 && mouseY < 450)
  {
    if(currentAlpha > 0)
    {
      currentAlpha-= 10;
    }
  }
  else if (mouseX < 140 && mouseX >40 && mouseY > 420 && mouseY < 450)
  {
    currentAlpha = 255;
  }
  else if (mouseX < 170 && mouseX >140 && mouseY > 420 && mouseY < 450)
  {
    if(currentAlpha < 255)
    {
      currentAlpha+= 10;
    }
  }
  
  /* Eraser */
  else if(mouseX < xCoords[1] && mouseX > xCoords[0] && mouseY > 460 && mouseY < 520)
  {    
    currentColor = palette[10];
  }
  
  /* Save */
  else if(mouseX < xCoords[2] && mouseX > xCoords[1] && mouseY > 460 && mouseY < 520)
  {
    
    save("screenshots/pittore" + saveCount + ".png"); //changename
    saveCount++; 
    
  }
  
  /* Clear */
  else if(mouseX < 180 && mouseX > xCoords[2] && mouseY > 460 && mouseY < 520)
  {
    
    createCanvas();
    
  }
}

void instructions()
{ 
  if(mouseY > 520 && mouseY < height && mouseX > xCoords[0] && mouseX < xCoords[1])
  {
    
    image(icons[12],0,0);
  }
  else
  {
    
    createPanel();
    
  }
}

void displayMode()
{
  switch(drawMode)
  {
    case 0:
    image(icons[13], 150, 530);
    break;
    
    case 1:
    image(icons[14], 150, 530);
    break;
    
    case 2:
    image(icons[15], 150, 530);
    break;
  }
}

