//Contributed by Tushar Agrawal
void setup(){
  size(800,600);
  fill(0);
  int frame=20; //(Change this value to increase or decrease the speed of Game Of Life. Note:- 0<frame<=60)
  frameRate(frame);
  
}
boolean first=true,stop=false;
boolean circ=false;//(Change the value of circ to make the block size circular and not square. Note:- circ=true or circ=false)
int d=15;//(Change this value to increase or decrease the size of each cell. Note:- d>0)
boolean mat[][]=new boolean[600/d][800/d];
void draw(){
  if(!stop)
  background(255);
  else
  background(200);
  if(first){
initialize();
}
if(!stop||first){
  first=false;
  boolean new_mat[][]=new boolean[600/d][800/d];
for(int i=0; i<mat.length; i++){
  for(int j=0; j<mat[0].length; j++){
    int c=count(i,j);
    if(mat[i][j]){
      if(c<2||c>3)new_mat[i][j]=false;
      else new_mat[i][j]=true;
    }
    if(!mat[i][j]){
      if(c==3)new_mat[i][j]=true;
      else new_mat[i][j]=false;
    }
    
  }
}
mat=new_mat;
}
//background(0);
for(int i=0; i<mat.length; i++){
  for(int j=0; j<mat[0].length; j++){
    if(mat[i][j])
      create(circ,i,j,d);
  }
}
}
void create(boolean circ,int i,int j,int d){
if(circ){
  circle(j*d+(d/2.0),i*d+(d/2.0),d);
}else{
  rect(j*d+(d/2.0),i*d+(d/2.0),d,d);
}
}
int count(int i, int j){
  int c=0;
  if(j-1>=0){
    if(mat[i][j-1])c++;
  }
  if(j+1<mat[0].length){
    if(mat[i][j+1])c++;
  }
  if(i-1>=0){
    if(mat[i-1][j])c++;
  }
  if(i+1<mat.length){
    if(mat[i+1][j])c++;
  }
  if(i-1>=0&&j-1>=0&&mat[i-1][j-1])c++;
  if(i-1>=0&&j+1<mat[0].length&&mat[i-1][j+1])c++;
  if(i+1<mat.length&&j-1>=0&&mat[i+1][j-1])c++;
  if(i+1<mat.length&&j+1<mat[0].length&&mat[i+1][j+1])c++;

   return c; 
}
void initialize(){
  for(int i=0; i<mat.length; i++){
    for(int j=0; j<mat[0].length; j++){
       if((int)random(0,10)==1){
         mat[i][j]=true;
       }
    }
  }
}
void keyPressed(){
if(key==97)stop=!stop;
}
void mouseDragged(){
mat[mouseY/d][mouseX/d]=true;
}
void mousePressed(){
mat[mouseY/d][mouseX/d]=true;
}
