
/*  2017.01.18 , 01.19  */

Mover[] movers ;
DoubleSpring[] springs ;
int linkNum ;
int focPoint ;
PVector gravity ;
PVector pull ;

void setup() {

  size( 800 , 400 ) ;

  gravity = new PVector(0 , 1) ;
  pull = new PVector(0 , 1) ;
  
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

  for(int q = 0 ; q < linkNum+1 ; q++) {
    Mover mov = movers[q] ;
    mov.applyForce( pull ) ;
  }
  
}

void draw() {
  
  background(200);
  
  for(int k = 0 ; k < linkNum ; k++) {

    DoubleSpring ds = springs[k] ;
        
    Mover movA = movers[k] ;
    Mover movB = movers[k+1] ;
    /* NOTE !!!
       movA is is is movers[k] object .
       Operating movA is is is Operating movers[k] .    
     */
     
    // test whether movers[0]->movA is a fact object .
    if( k == 0 ) {
      movB.signal = 2 ;   
    }
    if( k == 1 ) {
      //println("k = " + movA.signal );
      // result = 2
      /* 
         movers[0]->movA is is is a fact object .
       */
    }

    PVector sprForceForA = ds.updateForA( movA , movB ) ;
    movA.applyForce(sprForceForA) ;

    PVector sprForceForB = ds.updateForB( movA , movB ) ;
    movB.applyForce(sprForceForB) ;

    ds.display( movA , movB ) ;
    
  }
  
  for(int p = 0 ; p < linkNum+1 ; p++) {

    Mover m = movers[p] ;

    //m.applyForce( gravity ) ;
    m.update();
    m.checkEdge();
    m.display();
  }
  
}
