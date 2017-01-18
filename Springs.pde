
/*  2017.01.18 am 00:14 , am 06:12

*/

Mover mover ;
Spring spring ;
//PVector gravity ;

void setup() {
  
  size(640 , 320);
  
  PVector anchorLoc = new PVector( 320 , 40 ) ;
  PVector moverLoc  = new PVector( 320 , 120 ) ;

  mover = new Mover( moverLoc ) ;
  spring = new Spring( anchorLoc , 80 ) ;
  //gravity = new PVector(0 , 1) ;

}

void draw() {
  
  background(200);
  
  //mover.applyForce( gravity ) ;

  PVector sprForce = spring.connect( mover ) ;
  mover.applyForce( sprForce ) ;  

  mover.update() ;
  mover.checkEdge() ;
  mover.display() ;
  
  //mover.drag( mouseX , mouseY ) ;

  spring.display( mover ) ;
  
}

void mousePressed() {

  /* way1 */
  //PVector mouseLoc = new PVector( mouseX , mouseY ) ;
  //mover.location = mouseLoc.get() ;

  /* way2 */
  //mover.clicked( mouseX , mouseY ) ;
  
  /* pull a time */
  float forceStrength = map( (mouseY-mover.location.y) , 0 , 320 , 0 , 10 ) ;
  PVector pullForce = new PVector( 0 , forceStrength) ;  
  mover.applyForce( pullForce ) ;
  
}

/*
void mouseReleased() {
  //mover.stopDragging() ;
}
*/
