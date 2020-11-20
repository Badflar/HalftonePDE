class Cell {
  int i,j;
  int r = 0;
  int x,y;
  boolean isCalculated = false;
 
  
  Cell(int tempI, int tempJ) {
    i = tempI;
    j = tempJ;
    for (Primary primary : primaries) {
      if (primary.i == i && primary.j == j) {
        r = 10;
      }
    }
    x = i*20+20/2;
    y = j*20+20/2;
  }
  
  void display() {
    if(r == 10) {
       noStroke();
       fill(255);
       square(x,y,r);
       
      int reduction = 1;
      int currentr;
      int currentx;
      int currenty;
      float spread = 0;
      
      for (Primary primary : primaries) {
        if (primary.i == i && primary.j == j) {
          spread = primary.spread;
        }
      }
      
      for(int k = 1; k < spread+1; k++) {
        for(int i = -1 * k+1; i < k; i++) {
          for (int j = -1 * k+1; j < k; j++) {
            int offseti = this.i - i;
            int offsetj = this.j - j;
            if (offseti > -1 && offseti < cols &&offsetj > -1 && offsetj < rows) {
              if(grid[offseti][offsetj].r == 0) {
                grid[offseti][offsetj].r = 10 - reduction;
                 grid[offseti][offsetj].isCalculated = true;
                currentr = grid[offseti][offsetj].r;
              currentx = grid[offseti][offsetj].x;
              currenty = grid[offseti][offsetj].y;
              
              square(currentx,currenty,currentr);
              } else if (grid[offseti][offsetj].r != 0 && grid[offseti][offsetj].r != 10 && grid[offseti][offsetj].isCalculated == true) {
                grid[offseti][offsetj].r = (grid[offseti][offsetj].r + 10 - reduction)/2;
                currentr = grid[offseti][offsetj].r;
              currentx = grid[offseti][offsetj].x;
              currenty = grid[offseti][offsetj].y;
              
              square(currentx,currenty,currentr);
              }

            }
          }
        }
        reduction++;
      }
    }
  }
}

class Primary {
  float i,j, spread;
  
  Primary(float tempI, float tempJ, float tempSpread) {
    i = tempI;
    j = tempJ;
    spread = tempSpread;
  }
}
