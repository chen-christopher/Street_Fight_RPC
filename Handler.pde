void keyPressed() { //playing on keyboard

//for p1
  if (keyCode == RIGHT && g.charselect1 == false) { 
    p1HandlerRight = true;
  }
  if (keyCode == LEFT && g.charselect1 == false) {
    p1HandlerLeft=true;
  }
  if (keyCode == UP && g.charselect1 == false) {
    p1HandlerUp=true;
  }
  if (keyCode == DOWN && g.charselect1 == false) {
    p1HandlerDown=true;
  }
  
  //for p2
  if (key == 'j' && g.charselect2 == false) {
    p2HandlerRight=true;
  }
  if (key == 'g' && g.charselect2 == false) {
    p2HandlerLeft=true;
  }
  if (key=='y' && g.charselect2 == false) {
    p2HandlerUp=true;
  }
  if (key=='h'&& g.charselect2 == false) {
    p2HandlerDown=true;
  }
  if (g.gamestate==0 && key =='n') {
    g.pay = true;
    g.gamestate = 1;
  }
  //going through game states
  if (g.gamestate == 1 && key =='s'||g.gamestate == 1 && key =='d' ) {
    g.gamestate = 2;
  } else if (g.gamestate == 2 && key =='s' && g.charselect1 ==false) {
    g.charselect1 = true;
  }
  if (g.gamestate == 2 && key =='d' && g.charselect2 ==false) {
    g.charselect2 = true;
  }
  if (g.gamestate == 2 && key =='x' && g.charselect1 ==true) {
    g.charselect1 = false;
  }
  if (g.gamestate == 2 && key =='c' && g.charselect2 ==true) {
    g.charselect2 = false;
  }
  if (g.gamestate == 2 && key =='s' && g.charselect1 ==true && g.charselect2 == true) {
    g.gamestate = 3;
  }
  //p1
  if (keyCode == RIGHT && g.gamestate ==4) {
    g.player1.p1HandlerRight = true;
  } else if (keyCode == LEFT && g.gamestate ==4) {
    g.player1.p1HandlerLeft = true;
  } else if (keyCode == DOWN && g.gamestate ==4) {
    g.player1.p1HandlerDown = true;
  }else if (key == ',' && g.gamestate ==4 && g.player1.p1HandlerDown ==false && g.player1.p1HandlerRight ==false && g.player1.p1HandlerLeft ==false && g.player1.inAnimation == false) {
    g.player1.shootingr = true;
    g.player1.start_animation_frameCount = g.player1.frame;
  }
  else if(key == '.' && g.gamestate ==4 && g.player1.p1HandlerDown ==false && g.player1.p1HandlerRight ==false && g.player1.p1HandlerLeft ==false && g.player1.inAnimation == false){
    g.player1.shootingp = true;
    g.player1.start_animation_frameCount = g.player1.frame;
  }
  else if(key == '/' && g.gamestate==4 && g.player1.p1HandlerDown ==false && g.player1.p1HandlerRight ==false && g.player1.p1HandlerLeft ==false && g.player1.inAnimation == false){
    g.player1.shootings = true;
    g.player1.start_animation_frameCount = g.player1.frame;
  }
  //p2
  if (key == 'j' && g.gamestate ==4 &&  g.player2.inAnimation == false) {
    g.player2.p1HandlerRight = true;
    g.player2.inAnimation = true;
  } else if (key =='g' && g.gamestate ==4) {
    g.player2.p1HandlerLeft = true;
    g.player2.inAnimation = true;
  } else if (key == 'h' && g.gamestate ==4) {
    g.player2.p1HandlerDown = true;
    g.player2.inAnimation = true;
  }else if (key == 'z' && g.gamestate ==4 && g.player2.p1HandlerDown ==false && g.player2.p1HandlerRight ==false && g.player2.p1HandlerLeft ==false && g.player2.inAnimation == false) {
   //this long list of statements is to ensure that animation is perfomred and cannot be interrupted 
    g.player2.shootingr = true;
    g.player2.start_animation_frameCount = g.player2.frame;
  }else if (key == 'x' && g.gamestate ==4 && g.player2.p1HandlerDown ==false && g.player2.p1HandlerRight ==false && g.player2.p1HandlerLeft ==false && g.player2.inAnimation == false) {
    g.player2.shootingp = true;
    g.player2.start_animation_frameCount = g.player2.frame;
  }
  else if (key == 'c' && g.gamestate ==4 && g.player2.p1HandlerDown ==false && g.player2.p1HandlerRight ==false && g.player2.p1HandlerLeft ==false && g.player2.inAnimation == false) {
    g.player2.shootings = true;
    g.player2.start_animation_frameCount = g.player2.frame;
  }
  
}

void keyReleased() { //set the states to false 
  if (keyCode == RIGHT) {
    p1HandlerRight=false;
  } else if (keyCode == LEFT) {
    p1HandlerLeft=false;
  } else if (keyCode == UP) {
    p1HandlerUp=false;
  } else if (keyCode == DOWN) {
    p1HandlerDown=false;
  }
  if (keyCode == RIGHT && g.gamestate ==4) {
    g.player1.p1HandlerRight=false;
  } else if (keyCode == LEFT&& g.gamestate ==4) {
    g.player1.p1HandlerLeft=false;
  } else if (keyCode == UP&& g.gamestate ==4) {
    g.player1.p1HandlerUp=false;
  } else if (keyCode == DOWN&& g.gamestate ==4) {
    g.player1.p1HandlerDown=false;
  } 

  if (key == 'j' && g.gamestate ==4) {
    g.player2.p1HandlerRight = false;
  } else if (key =='g' && g.gamestate ==4) {
    g.player2.p1HandlerLeft = false;
  } else if (key == 'h' && g.gamestate ==4) {
    g.player2.p1HandlerDown = false;
  }

  if (key == 'j') {
    p2HandlerRight=false;
  }
  if (key == 'g') {
    p2HandlerLeft=false;
  }
  if (key=='y') {
    p2HandlerUp=false;
  }
  if (key=='h') {
    p2HandlerDown=false;
  }
}
