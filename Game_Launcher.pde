void setup(){
background(50);
size(800,600);
}
void draw(){
  
  background(50);
  
  // stroke(255);strokeWeight(1);
  fill(255);textSize(15);
  text("mouseX: " + mouseX+" mouseY: " + mouseY, 30, 30 ); 
  
  int[] rowBoxCount = {3,2};        // row 1 & 2 box count
  int[] rowBoxHeight = {300,450};
  
  //int row1 = 3;  int row2 = 2;    // row 1 & 2  (box count)
  //int rh1 = 300; int rh2 = 450;   // row 1 & 2  (box's y coordinates)
  
  int s = 100; int sp = 50;      //size && spacing
  
  int stp = (  width -  (  (s*rowBoxCount[0])  +  (sp*(rowBoxCount[0]-1))  )  ) /2  ; //starting point
  int stp2= ( width  -  (  (s*rowBoxCount[1])  +  (sp*(rowBoxCount[1]-1))  )  ) /2  ; //starting point

  //int row1Boxes = stp+0; int row2Boxes = row1Boxes+s+sp;  int b3 = row2Boxes+s+sp;
  //int row2Boxes1 = stp2+0; int row2Boxes2 = row2Boxes1+s+sp; 
  
  //coordinates for the boxes
  int[] row1Boxes = new int[rowBoxCount[0]];
  row1Boxes[0]=stp+0;
  for(int i = 1; i<row1Boxes.length;i++) {row1Boxes[i]=row1Boxes[i-1]+s+sp;}
   
  int[] row2Boxes = new int[rowBoxCount[1]];
  row2Boxes[0]=stp2+0;
  for(int i = 1; i<row2Boxes.length;i++) {row2Boxes[i]=row2Boxes[i-1]+s+sp;}
  
  //cross line   
  stroke(255);
  line(mouseX,0,mouseX,height);
  line(0,mouseY,width, mouseY);
  
  //title box 
  rect((width-600)/2,100,600,100);fill(255,0,0);

  //displaying boxes 
  for(int i = 0; i<rowBoxCount.length;i++){ 
    
    for(int j = 0; j<rowBoxCount[i];j++){
       
      rect(row1Boxes[j],rowBoxHeight[j],s,s);fill(255,0,0);
          System.out.println(i);

    }  
  }

}



    //System.out.println(rowBoxCount.length);
    
  //rect(row1Boxes[0],rowBoxHeight[0],s,s);fill(255,0,0);
  //rect(row1Boxes[1],rowBoxHeight[0],s,s);fill(255,0,0);
  //rect(row1Boxes[2],rowBoxHeight[0],s,s);fill(255,0,0);
  
  //rect(row2Boxes[0],rowBoxHeight[1],s,s);fill(255,0,0);
  //rect(row2Boxes[1],rowBoxHeight[1],s,s);fill(255,0,0);