/* Lasse eine zufällige Anzahl von weißen Kugeln fallen.
Die Kugeln fallen unterschiedlich schnell.
Beim Aufprall an der unteren Kante teilt sich die Kugel in 2 Hälften.
Helixförmig steigen die Kugeln nach oben und leuchten in bläulicher Farbe auf.
Desto höher die Kugel schwebt, desto mehr löst sie sich auf.
Wenn 2 Kugeln oben verschwinden, taucht oben wieder eine neue Kugel auf.*/


float start;
float end;
boolean upDown = true;

void setup(){
  size(700, 700);
}


void draw(){
  background(0);
  createEllipse();
 
}

void createEllipse(){ 
  
 noStroke();
  
  //int numEllipse = (int)random(5, 20);
  int numEllipse = 7;
  
  for(int i = 0; i < numEllipse; i++) {
  float sinWave = sin(radians((frameCount+i*10)/2));
  float sinWaveTwo = sin(radians((frameCount)));
  float cosWaveTwo = cos(radians((frameCount)));
  float ellipseWidth = 20+i*3;
  float xEllipse;
  float xEllipseTwo;
  
  
  float yEllipse = sinWave;
  yEllipse = map(yEllipse, -1.0, 1.0, 0+ellipseWidth/2, 700-ellipseWidth/2);
 
 end=yEllipse;
 float dif = end-start;
 
 if(dif>-0.9 && dif<0.9){
   if(upDown==true){
     upDown = false;
   }
   else{
     upDown = true;
   }
 }
 

 if(upDown == true){
   fill(255);
   xEllipse = 45+ i *100;
   ellipse(xEllipse, yEllipse, ellipseWidth, ellipseWidth);
 }
 else{
   fill(171, 230, i*50, 150);
   if(i %2 == 0){
   xEllipse = 45+ i *100 + sinWaveTwo*50 ;
   xEllipseTwo = 45+ i *100  -sinWaveTwo*50 -120;
   ellipse(xEllipse, yEllipse, ellipseWidth, ellipseWidth);
   ellipse(xEllipseTwo, yEllipse, ellipseWidth, ellipseWidth);
  }
  else{
   xEllipse =  45+ i *100  +sinWaveTwo*50 ;
   xEllipseTwo = 45+ i *100 - sinWaveTwo*50 -120;
   ellipse(xEllipse, yEllipse, ellipseWidth, ellipseWidth);
   ellipse(xEllipseTwo, yEllipse, ellipseWidth, ellipseWidth);
  }
 }
 
  
  start = yEllipse;
  }
}
