
/*  2017.01.18 am 00:16 

*/

class Mover
{
  PVector location ;
  PVector velocity ;
  PVector acceleration ;
  //PVector diffOffset ;
  //boolean isDrag ;
  int signal ;
  
  Mover( PVector loc ) {
    location = loc.get() ;
    velocity = new PVector(0 , 0) ;
    acceleration = new PVector(0 , 0) ;
    
    //diffOffset = new PVector(0 , 0) ; 
    //isDrag = false ;
    
    signal = 1 ;
  }
    
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void run() {
    update();
    checkEdge();
    display();
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);    
    acceleration.mult(0);
  }
  
  void checkEdge() {
    
    if( location.x < 0 || location.x > width )
      velocity.x = (-1) * velocity.x ;
     
    if( location.y < 0 || location.y > height )
      velocity.y = (-1) * velocity.y ; 
  }
  
  void display() {
    ellipse(location.x , location.y , 32 , 32) ;
  }

  /*  
  void clicked( int mx , int my ) {
    isDrag = true ;
    diffOffset.x = location.x - mx ;
    diffOffset.y = location.y - my ; 
  }
  
  void stopDragging() {
    isDrag = false ;
  }
  
  void drag( int mx , int my ) {
    if( isDrag ) {
      location.x = mx + diffOffset.x ;
      location.y = my + diffOffset.y ;
    }
  }
  */
}
