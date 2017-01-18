
/*  2017.01.18  */

Mover[] movers ;
DoubleSpring[] springs ;
int linkNum ;
int focPoint ;
PVector gravity ;

void setup() {

  size( 800 , 400 ) ;

  gravity = new PVector(0 , 1) ;
  
  linkNum = 3 ;
  focPoint = 30 ;

  movers  = new Mover[linkNum+1] ;
  for(int i = 0 ; i < linkNum+1 ; i++) {
    PVector startPo = new PVector( width/2 , focPoint ) ;
    movers[i] = new Mover( startPo ) ;
    focPoint += 30 ;
  }
  
  springs = new DoubleSpring[linkNum] ;
  for(int j = 0 ; j < linkNum ; j++) {
    springs[j] = new DoubleSpring(30) ;
  } 

  // s1 , start  
  /*
  sprLinks = new SpringLink[linkNum] ;
  focPoint = 30 ;
  
  for(int i = 0 ; i < linkNum ; i++) {
    
    PVector linkStart = new PVector( width/2 , focPoint ) ;
    focPoint += 30 ;
    PVector linkEnd   = new PVector( width/2 , focPoint ) ;
    focPoint += 30 ;
    
    sprLinks[i] = new SpringLink( linkStart , linkEnd , 
                                  linkStart ,      30   ) ;
  }
  */
  // s1 , end
}

void draw() {
  // s1 , start  
  /*
  for(int j = 0 ; j < linkNum ; j++) {
    SpringLink sl = sprLink[i].get() ;
    sl.update();
    sl.upOne.run();
    sl.downOne.run();
    sl.spr.display();
  }
  */
  // s1 , end
  
  background(200);
  
  for(int k = 0 ; k < linkNum ; k++) {

    DoubleSpring ds = springs[k] ;
    
    Mover movA = movers[k] ;
    Mover movB = movers[k+1] ;

    PVector sprForceForA = ds.updateForA( movA , movB ) ;
    movA.applyForce(sprForceForA) ;

    PVector sprForceForB = ds.updateForB( movA , movB ) ;
    movB.applyForce(sprForceForB) ;

    movA.applyForce( gravity ) ;
    if( k == linkNum-1 ) {
      movB.applyForce( gravity ) ;
    }    

    movA.run() ;
    movB.run() ;
    
    ds.display( movA , movB ) ;
    
  }
}
