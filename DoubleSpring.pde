
/*  2017.01.18 pm 15:22  */

class DoubleSpring {

  float normalLen ;
  float k ;
  
  DoubleSpring( float len ) {
    normalLen = len ;
    k = 0.1 ;
  }
  
  PVector updateForA( Mover ma , Mover mb ) {
    
    PVector diff = PVector.sub( ma.location , mb.location ) ;
    float currentLen = diff.mag() ;
    float x = currentLen - normalLen ;
    
    PVector sprForce = diff.get() ;
    sprForce.normalize() ;
    sprForce.mult( (-1) * k * x ) ;
    
    return sprForce ;
  }

  PVector updateForB( Mover ma , Mover mb ) {
    
    PVector diff = PVector.sub( ma.location , mb.location ) ;
    float currentLen = diff.mag() ;
    float x = currentLen - normalLen ;
    
    PVector sprForce = diff.get() ;
    sprForce.normalize() ;
    sprForce.mult( (-1) * k * x ) ;
    sprForce.mult(-1) ;
    
    return sprForce ;
  }
  
  void display( Mover ma , Mover mb ) {
    line( ma.location.x , ma.location.y , 
          mb.location.x , mb.location.y   ) ;
  }
}
