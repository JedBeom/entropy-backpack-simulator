PFont font;
int bagNum = 10;
float[] bagX = new float[bagNum];
float[] bagY = new float[bagNum];
int count = 0;
int step = 5;

void setup() {
  font = createFont("yspotlightot-regular", 160);
  textFont(font);

  size(1000, 1000);
  textSize(height/25);
  step = height/100;
  noStroke();
  background(255, 255, 255);
  for (int i = 0; i < bagNum; i++) {
    bagX[i] = (width/bagNum)*i;
    bagY[i] = (height/bagNum)*i;
  }

}

void draw() {
  if (count % 100 == 0) {
    saveFrame("image"+nf(count, 3)+".jpg");
  }
  
  background(255, 255, 255);
  
  fill(#9FC131);
  text(count +  "회", 5, height/25);
  
  for (int i = 0; i < bagNum; i++) {
    int direction = int(random(4));
    switch (direction) {
      case 0:
        bagX[i] += step;
        break;
      case 1:
        bagY[i] -= step;
        break;
      case 2:
        bagX[i] -= step;
        break;
      case 3:
        bagY[i] += step;
        break;
    }
    
    if (bagX[i] < 0) {
      bagX[i] = 0;
    } else if (bagX[i] >= width) {
      bagX[i] = width - 1;
    }
    
    if (bagY[i] < 0) {
      bagY[i] = 0;
    } else if (bagY[i] >= height) {
      bagY[i] = height - 1;
    }
    
    fill(0, 0, 0);
    text(i+1, bagX[i] + 5, bagY[i] + 5);
    fill(0, 0, 255, 150);
    ellipse(bagX[i], bagY[i], 10, 10);
  }
  
  count += 1;
}

void keyPressed() {
  if (key == 's') {
    saveFrame("image"+nf(count, 3)+".jpg");
    count += 1;
  }
}
