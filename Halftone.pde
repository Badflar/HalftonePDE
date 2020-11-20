import processing.pdf.*;

Cell[][] grid;
ArrayList<Primary> primaries;

int cols =25;
int rows = 25;

void setup () {
  size(500,500);
  beginRecord(PDF, "test.pdf");
  noLoop();
  rectMode(RADIUS);  
  
  primaries = new ArrayList<Primary>();
  for(int i = 0; i < 12; i++) {
   primaries.add(new Primary(round(random(25)), round(random(25)), 10));
  }
  
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i,j);
    }   
  }
}

void draw() {

  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].display();
    }
  }
  
  endRecord();
}

void keyPressed() {
   if (key=='Q') {
     endRecord();
     exit();
   }
}
