
/*  2017.01.18 am 00:33 

*/

class Spring {
 
  PVector anchor ;
  float len ;
  float k ;
  
  Spring( PVector loc , float l ) {
    anchor = loc.get() ;
    len = l ;
    k = 0.1 ;
  }
  
  PVector connect( Mover m ) {
    
    PVector diff = PVector.sub( m.location , anchor ) ;
    float currentLen = diff.mag();
    float x = currentLen - len ;
    
    PVector force = diff.get() ;
    force.normalize();
    force.mult( (-1) * k * x ) ;
    
    return force ;
  }
 
   void display( Mover m ) {
     
     rectMode( CENTER );
     rect( anchor.x , anchor.y , 8 , 8 ) ;
     
     line( anchor.x , anchor.y , m.location.x , m.location.y ) ;
   }
}
