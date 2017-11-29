Table table;
PFont font;
int select,sum;
boolean mark;
String h,e,s;

Button p1;
Button p2;
Button p3;
Button p4;

void setup(){
  size(1000,800);
  table= loadTable("HairEyeColor.csv","header");
  p1=new Button();
  p1.x=50;
  p1.y=100;
  p1.message="blond";
  p2=new Button();
  p2.x=50;
  p2.y=200;
  p2.message="male";
  p3=new Button();
  p3.x=50;
  p3.y=300;
  p3.message="blue";
  sum=0;
  
  for (TableRow row : table.rows()) {
    int freq=row.getInt("Freq");
    sum+=freq;  
  }
}

void draw(){
  background(255);
  p1.display();
  p2.display();
  p3.display();
  
  select=0;
  
  for (TableRow row : table.rows()) {   
   String hair = row.getString("Hair").toString();
   String eye = row.getString("Eye").toString();
   String sex= row.getString("Sex");
   int freq=row.getInt("Freq");
   mark=true;
   if (p1.press && (hair.charAt(2)!='o' || hair.charAt(1)!='l')){
     mark=false;
   }
   if (p2.press && sex.charAt(0)!='M'){  
     mark=false;
   }
   if (p3.press && eye.charAt(1)!='l'){
     mark=false;
   }
   if (mark){
     select+=freq;
   }
  }
   textSize(100);
   text("total:"+select,450,300);
   text("Pct:",450,400);
   text(select*100/sum+"%",450,500);
  
}

void mousePressed(){
  if(p1.check()){
    p1.press=!p1.press;
  }
  if (p2.check()){
    p2.press=!p2.press;
  }
  if(p3.check()){
    p3.press=!p3.press;
  }
}