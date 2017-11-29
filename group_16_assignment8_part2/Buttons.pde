class Button{
  int x,y;
  String message;
  boolean press=false;
  
  
  Button(){}
  void display(){
    if (press){
      fill(50);
    }else{
      fill(255);
    }
    rect(x,y,100,50);
    textSize(22);
    fill(0);
    text(message,x+30,y+50);
  }
  boolean check(){
    if (mouseX >= x && mouseX<=x+100 && mouseY>=y && mouseY<=y+50){
      return true;
    }else{
      return false;
  }
  }
}