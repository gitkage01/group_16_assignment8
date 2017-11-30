import org.gicentre.utils.stat.*;

BarChart barChart;

float y = 50;
float n = 0;

void setup() {
  size(500, 700);
  barChart = new BarChart(this);
  barChart.setData(new float[] {y, n});
  //barChart.setData(new float[] {0.76, 0.24, 0.39, 0.18, 0.20});
  
  String[] data = loadStrings("attendance.csv");
  String[] name = new String[data.length-1];
  String[] attended = new String[data.length-1];
  
  for (int i = 0; i < data.length - 1; i++) {
    String[] tokens = data[i+1].split(",");
    name[i] = tokens[0];
    attended[i] = tokens[1];
    println(attended[i]);
    
    if (attended[i] == "yes") {
      y += 1;
    } else if (attended[i] == "no") {
      n += 1;
    }
  }

}

void draw() {
  background(255);
  
 
  barChart.setMinValue(0);
  barChart.setMaxValue(50);
  
  barChart.showValueAxis(true);
  
  barChart.setBarLabels(new String[] {"Yes", "No"});
  
  barChart.showCategoryAxis(true);
  
  barChart.draw(15, 15, width - 30, height - 30);
}