//character class
class Player1 {
  int p; //equals the parameter that is passed from gencharacter to know which player you are 
  boolean rockp = false; //initally these states are false since you haven't made a move (these change depending on which button you press)
                         //if press the button such that (p1rockstate==1 || p2rockstate==2), rockp becomes true while paperp and scissorp becomes false
  boolean paperp = false;
  boolean scissorp = false;
  boolean alive = true; //to know if you're alive
  boolean hitd = false; //to know if you've been hit, if so, run hit animation (in code later on)
  boolean p1HandlerLeft = false;
  boolean p1HandlerRight = false;
  boolean p1HandlerDown = false;
  boolean p1HandlerUp = false;
  boolean inAnimation = false; //used to know if animation so you can't do other actions when in animation 
  boolean shootingr = false; //to know if you are in the shooting rock animation
  boolean shootingp = false; //same but for paper
  boolean shootings = false;//^ for scissors
  boolean win = false; 
  boolean lose = false;
  int battlestate = 0; //inital battle state (rock is battlestate 1, paper = battlestaet 2, scissor = battlestar 3)
  int charHeight;
  int charWidth;
  int start_animation_frameCount; //used to ensure a char in animation cannot do other actions
  int wincount;
  int x;
  int y;
  int vx;
  int vy;
  int frame;
  int direction = 0; //initally char is idle unless a button is pressed 
  PImage idle;
  PImage crouch;
  PImage moveright;
  PImage moveleft;
  PImage shoot;
  PImage idle2;
  PImage crouch2;
  PImage moveright2;
  PImage shoot2; 
  PImage hit;
  PImage hit2;
  Player1 (int player) {  
    p = player; //to know which player you are 
  } 
  void update() {
    if (p1HandlerLeft == true) {
      direction = -1;
      vx = -10;
      vy = 0;
    } else if (p1HandlerRight == true) {
      direction = 1;
      vx = 10;
      vy = 0;
    } else if (p1HandlerDown == true) {
      direction = -2;
      vx = 0;
      vy = 0;
    } else {
      direction = 0;
      vx = 0;
      vy = 0;
    }
    if (p1HandlerUp == true) {
      vx = 0;
      vy = 2;
      direction = 2;
    }
    x = x + vx;
    y = y + vy;
    frame++;
  }
  void display() {
    this.update();
    if (direction ==1) {//right
      image(moveright, 0, 0);
    } else if (direction == -1) {//left
      image(moveleft, 0, 0);
    } else if (direction == -2) {//down
      image(crouch, 0, 0);
    } else if (direction == 2) {//up
    } else if (direction ==0) {//idle
      image(idle, 0, 0);
    }
  }
}
class Ryu extends Player1 { //each character is a child of the parent class Player1
  Ryu(int p) {
    super(p);
  }  //carry on the player value (1 for p1, 2 for p2) to know which char is which 
  int charHeight = 312; //these are hardcoded to match the sprite images 
  int charWidth = 147;
  int charWidth2 = 290;
  int charWidth3 = 154;
  int charWidth4 = 160;
  int x = 50; //inital xpos 
  int x1 = 785-charWidth; //inital xpos for p2
  int y = 549-charHeight; //inital y pos
  PImage idle = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuIdle.gif");
  PImage crouch = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuCrouch.gif");
  PImage moveright = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuWalk.gif");
  PImage shoot = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuShoot.png");
  PImage idle2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuIdle2.gif");
  PImage crouch2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuCrouch2.gif");
  PImage moveright2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuWalk2.gif");
  PImage shoot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuShoot3.png");
  PImage hit = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuHit1.gif");
  PImage hit2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ryu/RyuResized/RyuHit2.gif");
  void block() { //so char won't run off screen
    if (x<-10) { //for p1
      x=x+abs(vx);
    } else if (x>599+70) {
      x=x-vx;
    }
    if (x1<-10) { //for p2
      x1 = x1+abs(vx);
    } else if (x1>599+70) {
      x1 = x1-vx;
    }
  }

  void update() {
    this.block();
    //p1
    if (p==1) { //if p1
      if (p1HandlerLeft == true && inAnimation == false && battlestate ==0) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false && battlestate ==0) {
        println("RIGHTTTTTTTT");
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false && battlestate ==0) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) { //if shoot rock button is pressed, you are in animation and in a battle state 
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp == true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate = 3;
      } else { //if do nothing, just stand there and be idle 
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    //p2
    if (p==2) {//same but for p2
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp ==true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate =3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    x = x + vx;
    y = y + vy;
    x1 = x1+vx;
    frame++; //essentially making my own framecount
  }
  void display() { //i load sprite images by having a sprite page and loading only a portion of the image and have it increment and show the next portion by the frames
    this.update();
    //p1
    if (direction ==1 && p == 1) {//right
      int sprite_index = (frame % 15)/3;
      image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
    } else if (direction == -1 && p == 1) {//left
      int sprite_index = (frame % 15)/3;
      image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
    } else if (direction == -2 && p == 1) {//down
      image(crouch, x, y, charWidth, charHeight, charWidth, 0, charWidth*2, charHeight);
    } else if (direction ==0 && battlestate == 0 && p == 1 && hitd ==false) {//idle
      int sprite_index = (frame % 12)/3;
      image(idle, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
    }
    //if in battlestate 1 and p1, p1 will do an anmiation and set the rockp to true, indicating that you have picked rock
    if (battlestate == 1 && p == 1) {
      if (frame >= start_animation_frameCount + 15) { //start_animation_framecount is the frame when you press the button and 
                                                      // how i ensured that the animation would run until completion was that the framecount + a hardcoded value
                                                      //to reprsent the frames needed and setting a state to true when this button is false and after the current frame
                                                      // is equal to the frame recorded by start_animation_framecount + n i would set inanimation back to false after completion 
        rockp = true;
        paperp = false;
        scissorp = false;
        shootingr = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
    } 
    else if (battlestate == 2 && p == 1) {//same but for paper
      if (frame == start_animation_frameCount + 15) {
        rockp = false;
        paperp = true;
        scissorp = false;
        shootingp = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
    } 
    else if (battlestate == 3 && p == 1) { //same but for scissor
      if (frame == start_animation_frameCount + 15) {
        rockp = false;
        paperp = false;
        scissorp = true;
        shootings = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
    } 
    else if (hitd == true & p ==1) { //if you get hit aka lose a round, you play an animation 
      if (frame == start_animation_frameCount + 20) {
        hitd = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%20) /5; //(frame % 15)/3;
      image(hit, x, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
    }
    
    //same but for p2
    //p2
    if (direction ==1 && p == 2) {//right
      int sprite_index = (frame % 15)/3;
      image(moveright2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
    } else if (direction == -1&& p == 2) {//left
      int sprite_index = (frame % 15)/3;
      image(moveright2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
    } else if (direction == -2 && p == 2) {//down
      image(crouch2, x1, y, charWidth, charHeight, 0, 0, charWidth, charHeight);
    } else if (direction ==0 && battlestate == 0 && p == 2 && hitd == false) {//idle
      int sprite_index = (frame % 12)/3;
      image(idle2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
    } else if (battlestate == 1 && p == 2) {
      if (frame == start_animation_frameCount + 15) {
        rockp = true;
        paperp = false;
        scissorp = false;
        shootingr = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot2, x1-140, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
    } else if (battlestate == 2 && p == 2) {
      if (frame == start_animation_frameCount + 15) {
        rockp = false;
        paperp = true;
        scissorp = false;
        shootingp = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot2, x1-140, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
    } else if (battlestate == 3 && p == 2) {
      if (frame == start_animation_frameCount + 15) {
        rockp = false;
        paperp = false;
        scissorp = true;
        shootings = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot2, x1-140, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
    } else if (hitd == true && p ==2) {
      if (frame == start_animation_frameCount + 20) {
        hitd = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%20) /5; //(frame % 15)/3;
      image(hit2, x1, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
    }
  }
}

//the comment above apply to all other characters, the values are just different cuz they have different height,width, frames in the images etc.
class Ehonda extends Player1 {
  Ehonda(int p) {
    super(p);
  }
  int charWidth = 215;
  int charWidth4 = 225;
  int charWidth1 = 240;
  int charWidth2 = 335;
  int charWidth3 = 345;
  int charHeight = 414;
  int y = 559-charHeight;
  int x = 50;
  int x1 = 770-charWidth;
  PImage idle = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaIdle.gif");
  PImage crouch = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaCrouch.gif");
  PImage moveright = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaWalk.png");
  PImage shoot = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaShoot.png");
  PImage idle2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaIdle2.gif");
  PImage crouch2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaCrouch2.gif");
  PImage moveright2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaWalk2.png");
  PImage shoot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaShoot3.png");
  PImage hit = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaHit.gif");
  PImage hit2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/EHonda/EhondaResized/EhondaHit2.gif");
  void block() {
    if (x<-15) {
      x=x+abs(vx);
    } else if (x>595) {
      x=x-vx;
    }
    if (x1<-15) {
      x1=x1+abs(vx);
    } else if (x1>595) {
      x1=x1-vx;
    }
  }
  void update() {
    this.block();
    //p1
    if (p==1) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp == true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate = 3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    //p2
    if (p==2) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true && shootingp ==false && shootings ==false) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp ==true && shootingr ==false && shootings ==false) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true && shootingr ==false && shootingp ==false) {
        inAnimation = true;
        battlestate =3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    x = x + vx;
    y = y + vy;
    x1 = x1+vx;
    frame++;
  }
  void display() {
    this.update();
    //p1
    if (direction ==1 && p==1) {//right
      int sprite_index = (frame % 12)/3;
      image(moveright, x, y, charWidth1, charHeight, charWidth1*sprite_index, 0, charWidth1*(sprite_index+1), charHeight);
    } else if (direction == -1 && p==1) {//left
      int sprite_index = (frame % 12)/3;
      image(moveright, x, y, charWidth1, charHeight, charWidth1*sprite_index, 0, charWidth1*(sprite_index+1), charHeight);
    } else if (direction == -2 && p==1) {//down
      image(crouch, x, y, charWidth, charHeight, charWidth, 0, charWidth*2, charHeight);
    } else if (direction ==0 && battlestate == 0 && p==1 && hitd == false) {//idle
      int sprite_index = (frame % 12)/3;
      image(idle, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
    } else if (battlestate ==1 && p==1) {
      if (frame == start_animation_frameCount + 15) {
        rockp = true;
        paperp = false;
        scissorp = false;
        shootingr = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot, x, y+50, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
    } else if (battlestate ==2 && p==1) {
      if (frame == start_animation_frameCount + 15) {
        rockp = false;
        paperp = true;
        scissorp = false;
        shootingp = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot, x, y+50, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
    } else if (battlestate ==3 && p==1) {
      if (frame == start_animation_frameCount + 15) {
        rockp = false;
        paperp = false;
        scissorp = true;
        shootings = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot, x, y+50, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
    } else if (hitd == true & p ==1) {
      if (frame == start_animation_frameCount + 12) {
        hitd = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%12) /4; //(frame % 15)/3;
      image(hit, x, y+25, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
    }
    //p2
    if (direction ==1 && p==2) {//right
      int sprite_index = (frame % 12)/3;
      image(moveright2, x1, y, charWidth1, charHeight, charWidth1*sprite_index, 0, charWidth1*(sprite_index+1), charHeight);
    } else if (direction == -1 && p==2) {//left
      int sprite_index = (frame % 12)/3;
      image(moveright2, x1, y, charWidth1, charHeight, charWidth1*sprite_index, 0, charWidth1*(sprite_index+1), charHeight);
    } else if (direction == -2 && p==2) {//down
      image(crouch2, x1, y, charWidth, charHeight, 0, 0, charWidth, charHeight);
    } else if (direction ==0 && battlestate == 0 && p==2 && hitd == false) {//idle
      int sprite_index = (frame % 12)/3;
      image(idle2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
    } else if (battlestate ==1 && p==2) {
      if (frame == start_animation_frameCount + 15) {
        rockp = true;
        paperp = false;
        scissorp = false;
        shootingr = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot2, x1-100, y+90, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
    } else if (battlestate ==2 && p==2) {
      if (frame == start_animation_frameCount + 15) {
        rockp = false;
        paperp = true;
        scissorp = false;
        shootingp = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot2, x1-100, y+90, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
    } else if (battlestate ==3 && p==2) {
      if (frame == start_animation_frameCount + 15) {
        rockp = false;
        paperp = false;
        scissorp = true;
        shootings = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
      image(shoot2, x1-100, y+90, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
    } else if (hitd == true & p ==2) {
      if (frame == start_animation_frameCount + 12) {
        hitd = false;
        battlestate = 0;
        inAnimation = false;
      }
      int sprite_index = (((frame) - start_animation_frameCount)%12) /4; //(frame % 15)/3;
      image(hit2, x1, y+25, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
    }
  }
}
class Blanka extends Player1 {
  Blanka(int p) {
    super(p);
  }
  int charHeight = 360;
  int charWidth = 211;
  int charWidth2 = 220;
  int charWidth3 = 205;
  int charWidth4 = 235;
  int x = 50;
  int x1 = 790 - charWidth;
  int y = 549-charHeight;
  PImage idle = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaIdle.gif");
  PImage crouch = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaCrouch.gif");
  PImage moveright = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaWalk.gif");
  PImage shoot = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaShoot.gif");
  PImage idle2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaIdle2.gif");
  PImage crouch2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaCrouch2.gif");
  PImage moveright2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaWalk2.gif");
  PImage shoot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaShoot2.gif");
  PImage hit = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaHit.gif");
  PImage hit2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Blanka/BlankaResized/BlankaHit2.gif");
  void block() {
    //p1
    if (x<-22) {
      x=x+abs(vx);
    } else if (x>599) {
      x=x-vx;
    }
    //p2
    if (x1<-22) {
      x1=x1+abs(vx);
    } else if (x1>619) {
      x1=x1-vx;
    }
  }
  void update() {
    this.block();
    //p1
    if (p==1) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp == true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate = 3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    //p2
    if (p==2) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp ==true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate =3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    x = x + vx;
    y = y + vy;
    x1 = x1+vx;
    frame++;
  }
  void display() {
    this.update();
    if (p==1) {
      if (direction ==1) {//right
        int sprite_index = (frame % 15)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 15)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch, x, y, charWidth, charHeight, charWidth, 0, charWidth*2, charHeight);
      } else if (direction == 2) {//up
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame % 12)/3;
        image(idle, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate == 1) {
        if (frame == start_animation_frameCount + 15) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 2) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 3) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 12) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /4; //(frame % 15)/3;
        image(hit, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } 
      //p2
    } else if (p==2) {
      if (direction ==1) {//right
        int sprite_index = (frame % 15)/3;
        image(moveright2, x1, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 15)/3;
        image(moveright2, x1, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch2, x1, y, charWidth, charHeight, 0, 0, charWidth, charHeight);
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame % 12)/3;
        image(idle2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate == 1) {
        if (frame == start_animation_frameCount + 15) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot2, x1-50, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      } else if (battlestate == 2) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot2, x1-50, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      } else if (battlestate == 3) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame+1) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot2, x1-50, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 12) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /4; //(frame % 15)/3;
        image(hit2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      }
    }
  }
}
class Guile extends Player1 {
  Guile(int p) {
    super(p);
  }
  int charHeight = 312;
  int charWidth = 158;
  int charWidth2 = 221;
  int charWidth3 = 150;
  int charWidth4 = 193;
  int charWidth5 = 210;
  int x = 50;
  int x1 = 770-charWidth;
  int y = 237;
  PImage idle = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileIdle.gif");
  PImage crouch = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileCrouch.gif");
  PImage moveright = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileWalk.gif");
  PImage shoot = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileShoot.png");
  PImage idle2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileIdle2.gif");
  PImage crouch2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileCrouch2.png");
  PImage moveright2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileWalk2.gif");
  PImage shoot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileShoot2.png");
  PImage hit = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileHit.gif");
  PImage hit2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Guile/GuileResized/GuileHit2.gif");

  void block() {
    //p1
    if (x<-22) {
      x=x+abs(vx);
    } else if (x>599+50) {
      x=x-vx;
    }
    //p2
    if (x1<-22) {
      x1=x1+abs(vx);
    } else if (x1>599+50) {
      x1=x1-vx;
    }
  }
  void update() {
    this.block();
    //p1
    if (p==1) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp == true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate = 3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    //p2
    if (p==2) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp ==true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate =3;
      } else {
        p1HandlerDown = false;
        p1HandlerLeft = false;
        p1HandlerRight = false;
        //p1HandlerDown = false;
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    x = x + vx;
    y = y + vy;
    x1 = x1+vx;
    frame++;
  }
  void display() {
    this.update();
    if (p==1) {
      if (direction ==1) {//right
        int sprite_index = (frame % 15)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 15)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch, x, y, charWidth, charHeight, charWidth, 0, charWidth*2, charHeight);
      } else if (direction == 2) {//up
      } else if (direction ==0 && battlestate == 0 && hitd == false) {//idle
        int sprite_index = (frame % 9)/3;
        image(idle, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate == 1) {
        if (frame == start_animation_frameCount + 9) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%9) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 2) {
        if (frame == start_animation_frameCount + 9) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%9) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 3) {
        if (frame == start_animation_frameCount + 9) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%9) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 12) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /4; //(frame % 15)/3;
        image(hit, x, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      }
    } 
    //p2
    else if (p==2) {
      if (direction ==1) {//right
        int sprite_index = (frame % 15)/3;
        image(moveright2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 15)/3;
        image(moveright2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch2, x1, y, charWidth, charHeight, charWidth, 0, charWidth*2, charHeight);
      } else if (direction ==0 && battlestate == 0 && hitd == false) {//idle
        int sprite_index = (frame % 9)/3;
        image(idle2, x1, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
      } else if (battlestate == 1) {
        if (frame == start_animation_frameCount + 9) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%9) /3; //(frame % 15)/3;
        image(shoot2, x1, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 2) {
        if (frame == start_animation_frameCount + 9) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%9) /3; //(frame % 15)/3;
        image(shoot2, x1, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 3) {
        if (frame == start_animation_frameCount + 9) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%9) /3; //(frame % 15)/3;
        image(shoot2, x1, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 12) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /4; //(frame % 15)/3;
        image(hit2, x1, y, charWidth5, charHeight, charWidth5*sprite_index, 0, charWidth5*(sprite_index+1), charHeight);
      }
    }
  }
}
class Ken extends Player1 {
  Ken(int p) {
    super(p);
  }
  int charHeight = 318;
  int charWidth = 150;
  int charWidth2 = 220;
  int charWidth4 = 170;
  int x = 50;
  int x1 = 760 - charWidth;
  int y = 549-charHeight;
  PImage idle = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenIdle.gif");
  PImage crouch = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenCrouch.gif");
  PImage moveright = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenWalk.gif");
  PImage shoot = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenShoot.png");
  PImage idle2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenIdle2.gif");
  PImage crouch2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenCrouch2.gif");
  PImage moveright2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenWalk2.gif");
  PImage shoot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenShoot2.png");
  PImage hit = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenHit.gif");
  PImage hit2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Ken/KenResized/KenHit2.gif");
  void block() {
    //p1
    if (x<-15) {
      x=x+abs(vx);
    } else if (x>599+80) {
      x=x-vx;
    }
    //p2
    if (x1<-15) {
      x1=x1+abs(vx);
    } else if (x1>599+80) {
      x1=x1-vx;
    }
  }
  void update() {
    this.block();
    //p1
    if (p==1) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp == true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate = 3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    //p2
    if (p==2) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp ==true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate =3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    x = x + vx;
    y = y + vy;
    x1 = x1+vx;
    frame++;
  }
  void display() {
    this.update();
    if (p==1) {
      if (direction ==1) {//right
        int sprite_index = (frame % 15)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 15)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch, x, y, charWidth, charHeight, charWidth, 0, charWidth*2, charHeight);
      } else if (direction == 2) {//up
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame %9)/3;
        image(idle, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate == 1) {
        if (frame == start_animation_frameCount + 12) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 2) {
        if (frame == start_animation_frameCount + 12) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 3) {
        if (frame == start_animation_frameCount + 12) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 16) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%16) /4; //(frame % 15)/3;
        image(hit, x, y-20, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      }
    } 

    //p2
    else if (p==2) {
      if (direction ==1) {//right
        int sprite_index = (frame % 15)/3;
        image(moveright2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 15)/3;
        image(moveright2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch2, x1, y, charWidth, charHeight, 0, 0, charWidth, charHeight);
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame %9)/3;
        image(idle2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate == 1) {
        if (frame == start_animation_frameCount + 12) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot2, x1-40, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 2) {
        if (frame == start_animation_frameCount + 12) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot2, x1-40, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate == 3) {
        if (frame == start_animation_frameCount + 12) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot2, x1-40, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 16) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%16) /4; //(frame % 15)/3;
        image(hit2, x1, y-20, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      }
    }
  }
}
class ChuYi extends Player1 {
  ChuYi(int p) {
    super(p);
  }
  int charHeight = 345;
  int charWidth1 = 175;
  int charWidth2 = 187;
  int charWidth = 155;
  int charWidth3 = 170;
  int charWidth4 = 190;
  int charWidth5 = 205;
  int x = 50;
  int x1 = 780-charWidth;
  int y = 549-charHeight;
  PImage idle = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiIdle.gif");
  PImage crouch = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiCrouch.gif");
  PImage moveright = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiWalk.gif");
  PImage shoot = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiShoot5.png");
  PImage idle2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiIdle2.gif");
  PImage crouch2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiCrouch2.gif");
  PImage moveright2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiWalk2.gif");
  PImage shoot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiShoot53.png");
  PImage hit = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiHit.gif");
  PImage hit2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/ChunYI/ChuYiResized/ChuYiHit2.gif");
  void block() {
    //p1
    if (x<-24) {
      x=x+abs(vx);
    } else if (x>599+55) {
      x=x-vx;
    }
    //p2
    if (x1<-24) {
      x1=x1+abs(vx);
    } else if (x1>599+55) {
      x1=x1-vx;
    }
  }
  void update() {
    this.block();
    //p1
    if (p==1) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp == true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate = 3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    //p2
    if (p==2) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp ==true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate =3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    x = x + vx;
    y = y + vy;
    x1 = x1+vx;
    frame++;
  }
  void display() {
    this.update();
    if (p==1) {
      if (direction ==1) {//right
        int sprite_index = (frame % 24)/8;
        image(moveright, x, y, charWidth1, charHeight, charWidth1*sprite_index, 0, charWidth1*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 24)/8;
        image(moveright, x, y, charWidth1, charHeight, charWidth1*sprite_index, 0, charWidth1*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch, x, y, charWidth, charHeight, charWidth, 0, charWidth*2, charHeight);
      } else if (direction == 2) {//up
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame % 12)/3;
        image(idle, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate ==1) {
        if (frame == start_animation_frameCount + 12) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate ==2) {
        if (frame == start_animation_frameCount + 12) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate ==3) {
        if (frame == start_animation_frameCount + 12) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 8) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%8) /4; //(frame % 15)/3;
        image(hit, x, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      }
    } 
    //p2
    else if (p==2) {
      if (direction ==1) {//right
        int sprite_index = (frame % 24)/8;
        image(moveright2, x1, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 24)/8;
        image(moveright2, x1, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch2, x1, y, charWidth, charHeight, 0, 0, charWidth, charHeight);
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame % 12)/3;
        image(idle2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate ==1) {
        if (frame == start_animation_frameCount + 12) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot2, x1-20, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate ==2) {
        if (frame == start_animation_frameCount + 12) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot2, x1-20, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate ==3) {
        if (frame == start_animation_frameCount + 12) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /3; //(frame % 15)/3;
        image(shoot2, x1-20, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 8) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%8) /4; //(frame % 15)/3;
        image(hit2, x1, y, charWidth5, charHeight, charWidth5*sprite_index, 0, charWidth5*(sprite_index+1), charHeight);
      }
    }
  }
}
class Zangief extends Player1 {
  Zangief(int p) {
    super(p);
  }
  int charHeight = 363;
  int charWidth = 210;
  int charWidth2 =262;
  int charWidth3 = 211;
  int charWidth4 = 215;
  int x = 50;
  int x1 = 790-charWidth;
  int y = 560-charHeight;
  PImage idle = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefIdle.gif");
  PImage crouch = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefCrouch.gif");
  PImage moveright = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefWalk.gif");
  PImage shoot = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefShoot.png");
  PImage idle2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefIdle3.gif");
  PImage crouch2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefCrouch2.gif");
  PImage moveright2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefWalk3.gif");
  PImage shoot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefShoot2.png");
  PImage hit = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefHit.gif");
  PImage hit2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Zangief/ZangiefResized/ZangiefHit2.gif");
  void block() {
    //p1
    if (x<-19) {
      x=x+abs(vx);
    } else if (x>599+30) {
      x=x-vx;
    }
    //p2
    if (x1<-19) {
      x1=x1+abs(vx);
    } else if (x1>599+20) {
      x1=x1-vx;
    }
  }
  void update() {
    this.block();
    //p1
    if (p==1) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp == true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate = 3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    //p2
    if (p==2) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp ==true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate =3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    x = x + vx;
    y = y + vy;
    x1 = x1+vx;
    frame++;
  }
  void display() {
    this.update();
    if (p==1) {
      if (direction ==1) {//right
        int sprite_index = (frame % 12)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 12)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch, x, y, charWidth, charHeight, charWidth, 0, charWidth*2, charHeight);
      } else if (direction == 2) {//up
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame % 9)/3;
        image(idle, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate ==1) {
        if (frame == start_animation_frameCount + 15) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate ==2) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate ==3) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 16) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%16) /4; //(frame % 15)/3;
        image(hit, x, y-20, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      }
    } 
    //p2
    else if (p==2) {
      if (direction ==1) {//right
        int sprite_index = (frame % 12)/3;
        image(moveright2, x1, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 12)/3;
        image(moveright2, x1, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch2, x1, y, charWidth, charHeight, 0, 0, charWidth, charHeight);
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame % 9)/3;
        image(idle2, x1, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
      } else if (battlestate ==1) {
        if (frame == start_animation_frameCount + 15) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot2, x1, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate ==2) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot2, x1, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate ==3) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot2, x1, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 16) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%16) /4; //(frame % 15)/3;
        image(hit2, x1, y-20, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      }
    }
  }
}

class Dhalism extends Player1 {
  Dhalism(int p) {
    super(p);
  }
  int charHeight = 342;
  int charWidth = 167;
  int charWidth2 = 314;
  int charWidth3 = 313;
  int charWidth4 = 170;
  int charWidth5 = 195;
  int x = 50;
  int x1 = 790-charWidth;
  int y = 549-charHeight;
  PImage idle = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismIdle.gif");
  PImage crouch = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismCrouch.gif");
  PImage moveright = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismWalk.gif");
  PImage shoot = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismShoot.png");
  PImage idle2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismIdle2.gif");
  PImage crouch2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismCrouch2.gif");
  PImage moveright2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismWalk2.gif");
  PImage shoot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismShoot5.png");
  PImage hit = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismHit.gif");
  PImage hit2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Sprites/Dhalism/DhalismResized/DhalismHit2.gif");
  void block() {
    //p1
    if (x<-22) { 
      x=x+abs(vx);
    } else if (x>599+50) {
      x=x-vx;
    }
    //p2
    if (x1<-22) { 
      x1=x1+abs(vx);
    } else if (x1>599+50) {
      x1=x1-vx;
    }
  }
  void update() {
    this.block();
    //p1
    if (p==1) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp == true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate = 3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    //p2
    if (p==2) {
      if (p1HandlerLeft == true && inAnimation == false) {
        direction = -1;
        vx = -13;
        vy = 0;
      } else if (p1HandlerRight == true && inAnimation == false) {
        direction = 1;
        vx = 13;
        vy = 0;
      } else if (p1HandlerDown == true && inAnimation == false) {
        direction = -2;
        vx = 0;
        vy = 0;
      } else if (shootingr == true) {
        inAnimation = true;
        battlestate = 1;
      } else if (shootingp ==true) {
        inAnimation = true;
        battlestate = 2;
      } else if (shootings == true) {
        inAnimation = true;
        battlestate =3;
      } else {
        direction = 0;
        vx = 0;
        vy = 0;
        battlestate = 0;
      }
    }
    x = x + vx;
    y = y + vy;
    x1 = x1+vx;
    frame++;
  }
  void display() {
    this.update();
    if (p==1) {
      if (direction ==1) {//right
        int sprite_index = (frame % 15)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 15)/3;
        image(moveright, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch, x, y, charWidth, charHeight, charWidth, 0, charWidth*2, charHeight);
      } else if (direction == 2) {//up
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame % 12)/3;
        image(idle, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate==1) {
        if (frame == start_animation_frameCount + 15) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate==2) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (battlestate==3) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot, x, y, charWidth2, charHeight, charWidth2*sprite_index, 0, charWidth2*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 12) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /4; //(frame % 15)/3;
        image(hit, x, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      }
    }

    if (p==2) {
      if (direction ==1) {//right
        int sprite_index = (frame % 15)/3;
        image(moveright2, x1, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      } else if (direction == -1) {//left
        int sprite_index = (frame % 15)/3;
        image(moveright2, x1, y, charWidth4, charHeight, charWidth4*sprite_index, 0, charWidth4*(sprite_index+1), charHeight);
      } else if (direction == -2) {//down
        image(crouch2, x1, y, charWidth, charHeight, 0, 0, charWidth, charHeight);
      } else if (direction ==0 && battlestate ==0 && hitd == false) {//idle
        int sprite_index = (frame % 12)/3;
        image(idle2, x1, y, charWidth, charHeight, charWidth*sprite_index, 0, charWidth*(sprite_index+1), charHeight);
      } else if (battlestate==1) {
        if (frame == start_animation_frameCount + 15) {
          rockp = true;
          paperp = false;
          scissorp = false;
          shootingr = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot2, x1-140, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
      } else if (battlestate==2) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = true;
          scissorp = false;
          shootingp = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot2, x1-140, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
      } else if (battlestate==3) {
        if (frame == start_animation_frameCount + 15) {
          rockp = false;
          paperp = false;
          scissorp = true;
          shootings = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%15) /3; //(frame % 15)/3;
        image(shoot2, x1-140, y, charWidth3, charHeight, charWidth3*sprite_index, 0, charWidth3*(sprite_index+1), charHeight);
      } else if (hitd == true) {
        if (frame == start_animation_frameCount + 12) {
          hitd = false;
          battlestate = 0;
          inAnimation = false;
        }
        int sprite_index = (((frame) - start_animation_frameCount)%12) /4; //(frame % 15)/3;
        image(hit2, x1, y, charWidth5, charHeight, charWidth5*sprite_index, 0, charWidth5*(sprite_index+1), charHeight);
      }
    }
  }
}
