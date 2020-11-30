void Arduino() {
  //in general, a button pressed on the console would set a boolean variable to true and that boolean variable would either allow you to 
  //get to the next screen, select char, or battle/move
  //general game {
  if (g.play == false && inByte == 'x') { //if p2paperstate == 0, reset game if game has ended (used this because the game was slightly bugged and would reset even if a 
  //button wasn't pressed when the game ended
      g.play = true;
      g.player1.win = false;
      g.player1.lose = false;
      g.player2.win = false;
      g.player2.lose = false;
      g.player1.alive = true;
      g.player2.alive = true;
      g.player1.wincount = 0;
      g.player2.wincount = 0;
      g.round = 1;
      g.charselect1 = false;
      g.charselect2 = false;
      g.gamestate = 2;
  }
  if (g.gamestate == 0 && inByte =='n') {//corresponds to button pressed 
    g.pay = true;
    g.gamestate = 1;
  }//selecting char and moving through gamestates
  if (g.gamestate == 1 && inByte ==','||g.gamestate == 1 && inByte =='z' ) {
    g.gamestate =  2;
  } else if (g.gamestate == 2 && inByte ==',' && g.charselect1 ==false) {
    g.charselect1 = true;
  } else if (g.gamestate == 2 && inByte ==',' && g.charselect1 ==true && g.charselect2 == true) {
    g.gamestate = 3;
  } else if (g.gamestate == 2 && inByte =='z' && g.charselect2 ==false) {
    g.charselect2 = true;
  } else if (g.gamestate == 2 && inByte =='z' && g.charselect1 ==true && g.charselect2 == true) {
    g.gamestate = 3;
  }


  if (g.gamestate == 2 && inByte =='c' && g.charselect2 ==true) {
    g.charselect2 = false;
  }
  // moving in char screen
  if (inByte !='j' && g.gamestate ==2) { //since there's no keyreleased for these buttons, I need to make my own and let it reset the boolean variables
                                         //that have been set to true
    p1HandlerRight = false;
  }
  if (inByte !='g' && g.gamestate ==2) {
    p1HandlerLeft = false;
  } 
  if (inByte !='h' && g.gamestate ==2) {
    p1HandlerDown = false;
  }
  if (inByte !='y' && g.gamestate ==2) {
    p1HandlerUp = false;
  }
  if (inByte !='d' && g.gamestate ==2) {
    p2HandlerRight = false;
  }
  if (inByte !='a' && g.gamestate ==2) {
    p2HandlerLeft = false;
  }
  if (inByte !='s' && g.gamestate ==2) {
    p2HandlerDown = false;
  }
  if (inByte !='w' && g.gamestate ==2) {
    p2HandlerUp = false;
  }
  if (inByte == 'j' && g.charselect1 == false) {
    p1HandlerRight = true;
  } else if (inByte == 'g' && g.charselect1 == false) {
    p1HandlerLeft=true;
  } else if (inByte == 'y' && g.charselect1 == false) {
    p1HandlerUp=true;
  } else if (inByte == 'h' && g.charselect1 == false) {
    p1HandlerDown=true;
  } else if (inByte =='y' && g.charselect1 == false) {
    p1HandlerUp = true;
  }
  if (inByte == 'd' && g.charselect2 == false) {
    p2HandlerRight=true;
  } else if (inByte == 'a' && g.charselect2 == false) {
    p2HandlerLeft=true;
  } else if (inByte == 'w' && g.charselect2 == false) {
    p2HandlerUp=true;
  } else if (inByte == 's'&& g.charselect2 == false) {
    p2HandlerDown=true;
  }

  //p1

  if (g.gamestate == 2 && inByte == '/' && g.charselect1 ==true) {
    g.charselect1 = false;
  }
  if (inByte !='j' && g.gamestate ==4) {
    g.player1.p1HandlerRight = false;
  }
  if (inByte !='g' && g.gamestate ==4) {
    g.player1.p1HandlerLeft = false;
  }
  if (inByte !='h' && g.gamestate ==4) {
    g.player1.p1HandlerDown = false;
  }
  //if (g.gamestate ==4) {
  //  g.player1.p1HandlerRight = false;
  //  g.player1.p1HandlerLeft = false;
  //  g.player1.p1HandlerDown = false;
  //  g.player1.shootingr = false;
  //  g.player1.shootings = false;
  //  g.player1.shootings = false;
  //}
  //this was used in an attempt to fix a "feature"
  if (inByte=='j' && g.gamestate ==4) {
    println("RIGHT");
    println(g.player1.inAnimation); //testing to see what the problem was 
    g.player1.p1HandlerRight = true;
  } else if (inByte=='g' && g.gamestate ==4) {
    g.player1.p1HandlerLeft = true;
  } else if (inByte=='h' && g.gamestate ==4) {
    g.player1.p1HandlerDown = true;
  } else if (inByte == ',' && g.gamestate ==4 && g.player1.p1HandlerDown ==false && g.player1.p1HandlerRight ==false && g.player1.p1HandlerLeft ==false && g.player1.inAnimation == false) {
    g.player1.shootingr = true;
    g.player1.start_animation_frameCount = g.player1.frame;
  } else if (inByte == '.' && g.gamestate ==4 && g.player1.p1HandlerDown ==false && g.player1.p1HandlerRight ==false && g.player1.p1HandlerLeft ==false && g.player1.inAnimation == false) {
    g.player1.shootingp = true;
    g.player1.start_animation_frameCount = g.player1.frame;
  } else if (inByte == '/' && g.gamestate==4 && g.player1.p1HandlerDown ==false && g.player1.p1HandlerRight ==false && g.player1.p1HandlerLeft ==false && g.player1.inAnimation == false) {
    g.player1.shootings = true;
    g.player1.start_animation_frameCount = g.player1.frame;
  }
  //p2
  if (inByte !='d' && g.gamestate ==4) {
    g.player2.p1HandlerRight = false;
  }
  if (inByte !='a' && g.gamestate ==4) {
    g.player2.p1HandlerLeft = false;
  }
  if (inByte !='s' && g.gamestate ==4) {
    g.player2.p1HandlerDown = false;
  }
  if (inByte == 'd' && g.gamestate ==4 && g.player2.inAnimation == false) {
    g.player2.p1HandlerRight = true;
  } else if (inByte == 'a' && g.gamestate ==4 && g.player2.inAnimation == false) {
    g.player2.p1HandlerLeft = true;
  } else if (inByte == 's' && g.gamestate ==4 && g.player2.inAnimation == false) {
    g.player2.p1HandlerDown = true;
  } else if (inByte == 'z' && g.gamestate ==4 && g.player2.p1HandlerDown ==false && g.player2.p1HandlerRight ==false && g.player2.p1HandlerLeft ==false && g.player2.inAnimation == false) {
    g.player2.shootingr = true;
    g.player2.start_animation_frameCount = g.player2.frame;
  } else if (inByte == 'x' && g.gamestate ==4 && g.player2.p1HandlerDown ==false && g.player2.p1HandlerRight ==false && g.player2.p1HandlerLeft ==false && g.player2.inAnimation == false) {
    g.player2.shootingp = true;
    g.player2.start_animation_frameCount = g.player2.frame;
  } else if (inByte == 'c' && g.gamestate ==4 && g.player2.p1HandlerDown ==false && g.player2.p1HandlerRight ==false && g.player2.p1HandlerLeft ==false && g.player2.inAnimation == false) {
    g.player2.shootings = true;
    g.player2.start_animation_frameCount = g.player2.frame;
  }
}
