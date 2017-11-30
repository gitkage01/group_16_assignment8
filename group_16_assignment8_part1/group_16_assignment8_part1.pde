import org.gicentre.utils.stat.*;

BarChart barChart;

float y = 0;
float n = 0;
int i=0;



void setup() {
  size(500, 700);
  barChart = new BarChart(this);
  //barChart.setData(new float[] {0.76, 0.24, 0.39, 0.18, 0.20});
  barChart.setData(new float[] {y, n});
  barChart.setMinValue(0);
  barChart.setMaxValue(50);
  
  barChart.showValueAxis(true);
  
  barChart.setBarLabels(new String[] {"Yes", "No"});
  
  barChart.showCategoryAxis(true);

}

void draw() {
  background(255);
  String[] data = loadStrings("attendance.csv");
  String[] name = new String[data.length-1];
  String[] attended = new String[data.length-1];
  String[] tokens = data[i+1].split(",");
  name[i] = tokens[0];
  attended[i] = tokens[1];
  //println(attended[i]);   
  if (attended[i].charAt(0) == 'y') {
    y += 1;
  } else if (attended[i].charAt(0) == 'n') {
    n += 1;
  }
  barChart.setData(new float[] {y, n});
  barChart.draw(15, 15, width - 30, height - 30);
  delay(50);
  i+=1;
  //println(y,n);
  if (i>=62){
    noLoop();
  }
  
}