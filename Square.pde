class Square
{
  /* Fields */
  int sSize;
  int xCoord, yCoord;
  color sColor;
  int sAlpha;
  
  /* Constructor */
  Square(int x, int y, int s, color c, int a)
  {
    xCoord = x;
    yCoord = y;
    sSize = s;
    sColor = c;
    sAlpha = a;
  }
  /* Methods */
  void displaySquare()
 {
   rectMode(CENTER);
   fill(sColor, sAlpha);
   rect(xCoord, yCoord, sSize, sSize);
   rectMode(CORNER);
 } 
 
}
