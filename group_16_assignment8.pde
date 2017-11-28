import controlP5.*;

ControlP5 cp5;
RadioButton r1, r2;

XML[] children3;
XML[] children1;
XML[] children2;

String[] titles;
StringDict link;
String[] descriptions;
String pubDate;

PFont font;

float[] y1Vals;
float[] y2Vals;

int screen = 1;
int screenTotal;

PImage next;
PImage prev;

Button nextButton;
Button prevButton;

String url;
String headline;

void setup() {
  size(800, 900);
  background(0);
  
  nextButton = new Button();
  next = loadImage("next.png");
  nextButton.img = next;
  nextButton.xpos = 680;
  nextButton.ypos = 10;
  nextButton.widthVal = width/8;
  nextButton.heightVal = height/16;

  
  prevButton = new Button();
  prev = loadImage("previous.png");
  prevButton.img = prev;
  prevButton.xpos = 560;
  prevButton.ypos = 10;
  prevButton.widthVal = width/8;
  prevButton.heightVal = height/16;
  
  cp5 = new ControlP5(this);
  r1 = cp5.addRadioButton("radioButtons")
          .setPosition(100, 625)
          .setSize(30, 30)
          .setColorForeground(color(120))
          .setColorActive(color(185))
          .setColorLabel(color(255))
          .setItemsPerRow(5)
          .setSpacingColumn(100)
          .addItem("NBA", 1)
          .addItem("David Aldridge", 2)
          .addItem("NBA Power Rankings", 3)
          .addItem("The Starters", 4)
          .addItem("Steve Aschburner", 5)
          ;
  
  font = loadFont("ErasITC-Medium-48.vlw");
  headline = "NBA News";
  
}

void draw() {
  background(0);
  
  stroke(250);
  
  line(0, 685, 800, 685);
  
  url = "http://www.nba.com/rss/nba_rss.xml";
  
  if (r1.getState(0) == true) {
    url = "http://www.nba.com/rss/nba_rss.xml";
    headline = "NBA News";
  }
  if (r1.getState(1) == true) {
    url = "http://www.nba.com/rss/david_aldridge.rss";
    headline = "Aldridge";
  }
  if (r1.getState(2) == true) {
    url = "http://www.nba.com/powerrankings/rss.xml";
    headline = "Power Rankings";
  }
  if (r1.getState(3) == true) {
    url = "http://www.nba.com/the_starters/rss.xml";
    headline = "The Starters";
  }
  if (r1.getState(4) == true) {
    url = "http://www.nba.com/rss/steve_aschburner.rss";
    headline = "Aschburner";
  }
  
  XML xml = loadXML(url);
  
  children1 = xml.getChildren("channel/item/title");
  children2 = xml.getChildren("channel/item/description");
  children3 = xml.getChildren("channel/pubDate");
  
  String pubDate = children3[0].getContent();
  
  titles = new String[children1.length];
  descriptions = new String[children2.length];
  y1Vals = new float[children1.length];
  y2Vals = new float[children1.length];
  link = new StringDict();  
  
  for (int i = 0; i < children1.length; i++) {
    String title = children1[i].getContent();
    titles[i] = title;
  }
  
  screenTotal = (titles.length/6) + 1;
  
  for (int i = 0; i < children2.length; i++) {
    String description = children2[i].getContent();
    descriptions[i] = description;
  }
  
  for (int i = 0; i < descriptions.length; i++) {
    link.set(titles[i], descriptions[i]);
  }
  
  float y1 = 100;
  float y2 = 170;

  if (screen == 1) {
    for (int i = 0; i < 6; i++) {
      textFont(font, 27);
      text("-- " + titles[i], 20, y1, 750, y2);
      y1Vals[i] = y1;
      y2Vals[i] = y2;
      y1 += 90;
      y2 += 90;
    }
  }
  
  if (screen > 1 && screen < screenTotal) {
    for (int i = (6 * screen) - 6; i < 6 * screen; i++) {
      textFont(font, 27);
      text("-- " + titles[i], 20, y1, 750, y2);
      y1Vals[i] = y1;
      y2Vals[i] = y2;
      y1 += 90;
      y2 += 90;
    }
  }
  if (screen > 1 && screen == screenTotal) {
    for (int i = (6 * screen) - 6; i < titles.length; i++) {
      textFont(font, 27);
      text("-- " + titles[i], 20, y1, 750, y2);
      y1Vals[i] = y1;
      y2Vals[i] = y2;
      y1 += 90;
      y2 += 90;
    }
  }
  
  nextButton.display();
  prevButton.display();
  
  textFont(font, 40);
  text(headline, 50, 50);
  textFont(font, 20);
  text(pubDate, 50, 75);

}

boolean overButton(int xposition, int yposition, int widthval, int heightval) {
  if (mouseX >= xposition && mouseX <= xposition + widthval && mouseY >= yposition && mouseY <= yposition + heightval) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  if (overButton(nextButton.xpos, nextButton.ypos, nextButton.widthVal, nextButton.heightVal)) {
    if (screen != screenTotal) {
      screen += 1;
    }
  }
  if (overButton(prevButton.xpos, prevButton.ypos, prevButton.widthVal, prevButton.heightVal)) {
    if (screen != 1) {
      screen -= 1;
    }
  }
}