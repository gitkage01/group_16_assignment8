class Button {
  PImage img;
  int xpos, ypos, widthVal, heightVal;
  
  Button() {}
  
  void display() {
    image(img, xpos, ypos, widthVal, heightVal);
  }
}
    