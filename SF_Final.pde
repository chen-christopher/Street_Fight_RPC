import processing.serial.*;
Serial myPort;
char inByte; //for communication with arduino
PImage[] intro= new PImage[65]; //creating PImage for the intro sequence (breaking brick wall) --> these continue to run
PImage[] credit = new PImage[2]; //creating PImage for another sequence 
PImage select; //char selection box
PImage map; //map of the world that changes when you pick a different character
PImage headshot; //headshot of the character player1 hovers over
PImage headshot2; //same but for p2
PImage p1font; //p1 text displayed above headshot
PImage p2font; //same but for p2
PImage charfont1; //text of the character that p1 is currently hovering over
PImage charfont2;
PImage charfontsel1;
PImage charfontsel2;
PImage country;
PImage versus;
PImage victory;
PImage ready[] = new PImage[2]; //loads "ready" that is blinking when both char are selected
PImage[]pressStart = new PImage[4]; //loads "press start" in the char select screen
PImage[]mapDisplay = new PImage[5]; //background for the battle is a sequence that changes 
PImage wintoken; //displaying how many wins you have
PImage r1; //text for r1-r5
PImage r2;
PImage r3;
PImage r4;
PImage r5;
PImage rocktext; //displays the rock apaper scissor text
PImage papertext;
PImage scissortext;
PImage shoottext;
PImage rock; // image of the choice you make in rock paper sicssors
PImage paper;
PImage scissor;
PImage p1win; //displays player 1 wins
PImage p2win;
boolean p1HandlerLeft = false; //direction handlers for each player ONLY within char select screen
boolean p1HandlerRight = false;
boolean p1HandlerDown = false;
boolean p1HandlerUp = false;
boolean p2HandlerLeft = false;
boolean p2HandlerRight = false;
boolean p2HandlerDown = false;
boolean p2HandlerUp = false;
int xPortrait = 269; //size of the headshot portrait
int yPortrait = 379; 
int xSizePortraitInc = 66; //size of the char selection faces within the char selecion box, used to move the blinking rectangle indicating which char you are on
int ySizePortraitInc = 74;
int player1sel = 1; //the character that you hover gives back a number, used to tell which char you are selecting 
int player2sel = 2;
int p1 = 1; //variable that is passed to tell the classes which player you are (either player 1 or palyer 2)
int p2 = 2;
void setup() {
  size( 800, 599 );
  intro[0]= loadImage("/Users/mac/Desktop/Opening/3a.gif");
  intro[1]= loadImage("/Users/mac/Desktop/Opening/4a.gif");
  intro[2] = loadImage("/Users/mac/Desktop/Opening/3b.gif");
  intro[3] = loadImage("/Users/mac/Desktop/Opening/4b.gif");
  intro[4] = loadImage("/Users/mac/Desktop/Opening/3c.gif");
  intro[5] = loadImage("/Users/mac/Desktop/Opening/4c.gif");
  intro[6] = loadImage("/Users/mac/Desktop/Opening/3d.gif");
  intro[7] = loadImage("/Users/mac/Desktop/Opening/4d.gif");
  intro[8] = loadImage("/Users/mac/Desktop/Opening/3e.gif");
  intro[9] = loadImage("/Users/mac/Desktop/Opening/4e.gif");
  intro[10] = loadImage("/Users/mac/Desktop/Opening/3f.gif");
  intro[11] = loadImage("/Users/mac/Desktop/Opening/4f.gif");
  intro[12] = loadImage("/Users/mac/Desktop/Opening/3.gif");
  intro[13] = loadImage("/Users/mac/Desktop/Opening/4.gif");
  intro[14] = loadImage("/Users/mac/Desktop/Opening/5.gif");
  intro[15] = loadImage("/Users/mac/Desktop/Opening/6.gif");
  intro[16] = loadImage("/Users/mac/Desktop/Opening/7.gif");
  intro[17] = loadImage("/Users/mac/Desktop/Opening/8.gif");
  intro[18] = loadImage("/Users/mac/Desktop/Opening/9.gif");
  intro[19] = loadImage("/Users/mac/Desktop/Opening/10.gif");
  intro[20] = loadImage("/Users/mac/Desktop/Opening/11.gif");
  intro[21] = loadImage("/Users/mac/Desktop/Opening/12.gif");
  intro[22] = loadImage("/Users/mac/Desktop/Opening/13.gif");
  intro[23] = loadImage("/Users/mac/Desktop/Opening/14.gif");
  intro[24] = loadImage("/Users/mac/Desktop/Opening/15.gif");
  intro[25] = loadImage("/Users/mac/Desktop/Opening/16.gif");
  intro[26] = loadImage("/Users/mac/Desktop/Opening/17.gif");
  intro[27] = loadImage("/Users/mac/Desktop/Opening/18.gif");
  intro[28] = loadImage("/Users/mac/Desktop/Opening/19.gif");
  intro[29] = loadImage("/Users/mac/Desktop/Opening/20.gif");
  intro[30] = loadImage("/Users/mac/Desktop/Opening/21.gif");
  intro[31] = loadImage("/Users/mac/Desktop/Opening/22.gif");
  intro[32] = loadImage("/Users/mac/Desktop/Opening/23.gif");
  intro[33] = loadImage("/Users/mac/Desktop/Opening/24.gif");
  intro[34] = loadImage("/Users/mac/Desktop/Opening/25.gif");
  intro[35]= loadImage("/Users/mac/Desktop/Opening/1.gif");
  intro[36]= loadImage("/Users/mac/Desktop/Opening/2.gif");
  intro[37] = loadImage("/Users/mac/Desktop/Opening/1a.gif");
  intro[38] = loadImage("/Users/mac/Desktop/Opening/2a.gif");
  intro[39] = intro[37];
  intro[40] = intro[38];
  intro[41] = intro[37];
  intro[42] = intro[38];
  intro[43] = intro[37];
  intro[44] = intro[38];
  intro[45] = intro[37];
  intro[46] = intro[38];
  intro[47] = intro[37];
  intro[48] = intro[38];
  intro[49] = intro[37];
  intro[50] = intro[38];
  intro[51] = intro[37];
  intro[52] = intro[38];
  intro[53] = intro[37];
  intro[54] = intro[38];
  intro[55] = intro[37];
  intro[56] = intro[38];
  intro[57] = intro[37];
  intro[58] = intro[38];
  intro[59] = intro[37];
  intro[60] = intro[38];
  intro[61] = intro[37];
  intro[62] = intro[38];
  intro[63] = intro[37];
  intro[64] = intro[38]; //intro sequence
  credit[0] = loadImage("/Users/mac/Desktop/Opening/paid.gif"); 
  credit[1] = loadImage("/Users/mac/Desktop/Opening/paid2.gif"); 
  select = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/selection.jpg");
  p1font = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/p1.png");
  p2font = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/p2.png");
  pressStart[0] = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/press.png");
  pressStart[1] = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/empty.png");
  pressStart[2] = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/start.png");
  pressStart[3] = pressStart[1];
  charfontsel1 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/p1char.png");
  charfontsel2 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/p2char.png");
  versus = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/vs.png");
  versus.resize(2*versus.width/5, 2*versus.height/5);
  ready[0] = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/ready.png");
  ready[1] = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/ready1.png");
  victory = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/wintoken2.png");
  r1 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/round1.png");
  r2 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/round2.png");
  r3 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/round3.png");
  r4 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/round4.png");
  r5 = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/round5.png");
  rocktext = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/rt.png");
  papertext = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/pt.png");
  scissortext = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/st.png");
  shoottext = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/shoot.png");
  rock = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/rock2.png");
  paper = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/paper2.png");
  scissor = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/scissor2.png");
  p1win = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/p1win.png");
  p2win = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_GameDisplay/p2win.png");
  //loading images in setup 
  //String portName = Serial.list()[16];
  //myPort = new Serial(this, portName, 9600);
  //for (int i=0; i<=20; i++) {
  //  println(Serial.list()[i]);
  //}

  g = new Game(); //initalizing the game
}

void draw() {
  //if (myPort.available()>0){ //has to be a char
  //  inByte = myPort.readChar(); //I only send one char so I had inByte read char
  //}
  
  //println(inByte); //testing to see if I got a value 
  //myPort.clear(); //clear after each time I read
  //Arduino();
  //myPort.clear(); //clear after each time I read
  if (g.gamestate ==0) { //when coin is not inserted, play the intro sequence 
    frameRate(5);
    g.introduction();
  } else if (g.gamestate == 1) { //when coin is inserted, play another sequence that indicates that game is ready to be palyed
    frameRate(5);
    g.payscreen();
  } else if (g.gamestate == 2) { //if the start button (p1rockstate ==1 || p2rockstate==1) is pressed, show the char selection screen
    frameRate(3);
    g.charSelectScreen();
  } else if (g.gamestate == 3) { //if both char are selected, there is a battle loading screen
    frameRate(10);
    g.battleLoadScreen();
  } else if (g.gamestate == 4) { // the actual game
    frameRate(20);
    g.mapdisplay();
    g.battledec();
    g.battleState();
    g.battle();
    g.checkwin();
    g.reset();
  }
}


class Game {
  float mapchoice =int(random(1, 7)); //run random maps each time
  boolean play = true; //indicating that game is ready to be played (used to reset the game after it finishes)
  boolean pay = false; // if you paid
  boolean start = false; //if p1rockstate ==1 || p2rockstate ==1
  boolean charselect1 = false; // to tell if a char is selected in the char select screen for p1
  boolean charselect2 = false;
  long timer; //timer used for countdown in the game
  int gamestate = 0; //start the game state at 1 
  int round = 1; //in the game, round starts at round 1
  Player1 player1; //initalize player class
  Player1 player2;
  void introduction() {
    if (pay == false) {
      image(intro[frameCount%65], -6, -4);
    }
  }
  void payscreen() {
    frameRate(4);
    image(credit[frameCount%2], -6, -4);
  }
  void charSelectScreen() {
    background(3, 11, 150);
    noStroke();
    pressStart(); //shows a blinking press start on hte top of the screen
    image(select, width/3+3, height-220, width/3, height/4); //loading images
    image(p1font, 60, 250);
    image(p2font, width-p2font.width-60, 250);
    selectionp1(); //method used for char selection 
    selectionp2();
    if (charselect1 == true && charselect2 == true) { //if character selected for both players, prompt a blinking ready
      frameRate(2);
      image(ready[frameCount%2], width/2-96, height/2);
    }
  }
  void genCharacter1(int selection) { //creating character
    if (selection == 1) { //selection (which char you pick) is the paramter that is passed into this function to know which char to load
      player1 = new Ryu(p1);
    } else if (selection ==2) {
      player1 = new Ehonda(p1);
    } else if (selection == 3) {
      player1 = new Blanka(p1);
    } else if (selection == 4) {
      player1 = new Guile(p1);
    } else if (selection == 5) {
      player1 = new Ken(p1);
    } else if (selection == 6) {
      player1 = new ChuYi(p1);
    } else if (selection == 7) {
      player1 = new Zangief(p1);
    } else if (selection ==8) {
      player1 = new Dhalism(p1);
    }
  }
  void genCharacter2(int selection) {//same but for p2
    if (selection == 1) {
      player2 = new Ryu(p2);
    } else if (selection ==2) {
      player2 = new Ehonda(p2);
    } else if (selection == 3) {
      player2 = new Blanka(p2);
    } else if (selection == 4) {
      player2 = new Guile(p2);
    } else if (selection == 5) {
      player2 = new Ken(p2);
    } else if (selection == 6) {
      player2 = new ChuYi(p2);
    } else if (selection == 7) {
      player2 = new Zangief(p2);
    } else if (selection ==8) {
      player2 = new Dhalism(p2);
    }
  }

  void battleLoadScreen() { //shows the battle load screen
    long change = 0;
    if (frameCount - change > 60) { //tried to show the battleload screen for a little time before it goes into the game, but didn't really work
      mapload(); //loading map and generating char 
      genCharacter1(player1sel); //generating here so I'm not always regenerating my char in draw later on
      genCharacter2(player2sel);
      gamestate = 4;
    }

    background(0, 1, 32);
    noFill();
    stroke(255);
    line(width/2, 0, width/2, height); //display of battle load screen
    image(versus, width/2-versus.width/2, 3*height/4-100); 
    if (player1sel==1) {
      image(headshot, 20, height/2-height/5, width/4, height/2.5);
      image(charfont1, 70, 440);
    } else if (player1sel==2) {
      image(headshot, 20, height/2-height/5, width/4, height/2.5); 
      image(charfont1, 15, 440);
    } else if (player1sel==3) {
      image(headshot, 20, height/2-height/5, width/4, height/2.5);
      image(charfont1, 25, 440);
    } else if (player1sel==4) {
      image(headshot, 20, height/2-height/5, width/4, height/2.5);
      image(charfont1, 35, 440);
    } else if (player1sel==5) {
      image(headshot, 20, height/2-height/5, width/4, height/2.5);
      image(charfont1, 75, 440);
    } else if (player1sel==6) {
      image(headshot, 20, height/2-height/5, width/4, height/2.5);
      image(charfont1, 15, 440);
    } else if (player1sel==7) {
      image(headshot, 20, height/2-height/5, width/4, height/2.5);
      image(charfont1, 10, 440);
    } else if (player1sel==8) {
      image(headshot, 20, height/2-height/5, width/4, height/2.5);
      image(charfont1, 5, 440);
    }
    if (player2sel==1) {
      image(headshot2, width-width/4-20, height/2-height/5, width/4, height/2.5);
      image(charfont2, width-charfont2.width-65, 440);
    } else if (player2sel==2) {
      image(headshot2, width-width/4-20, height/2-height/5, width/4, height/2.5);
      image(charfont2, width-charfont2.width-10, 440);
    } else if (player2sel==3) {
      image(headshot2, width-width/4-20, height/2-height/5, width/4, height/2.5);
      image(charfont2, width-charfont2.width-25, 440);
    } else if (player2sel==4) {
      image(headshot2, width-width/4-20, height/2-height/5, width/4, height/2.5);
      image(charfont2, width-charfont2.width-35, 440);
    } else if (player2sel==5) {
      image(headshot2, width-width/4-20, height/2-height/5, width/4, height/2.5);
      image(charfont2, width-charfont2.width-65, 440);
    } else if (player2sel==6) {
      image(headshot2, width-width/4-20, height/2-height/5, width/4, height/2.5);
      image(charfont2, width-charfont2.width-8, 440);
    } else if (player2sel==7) {
      image(headshot2, width-width/4-20, height/2-height/5, width/4, height/2.5);
      image(charfont2, width-charfont2.width-5, 440);
    } else if (player2sel==8) {
      image(headshot2, width-width/4-20, height/2-height/5, width/4, height/2.5);
      image(charfont2, width-charfont2.width-10, 440);
    }
  }
  void battleState() {
    player1.display(); //actualyl displaying the char
    player2.display();
  }
  void mapload() { //loading map that dpeends on a random number
    if (mapchoice ==1) {
      mapDisplay[0] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/JapanMoving/1.gif");
      mapDisplay[1] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/JapanMoving/2.gif");
      mapDisplay[2] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/JapanMoving/3.gif");
      mapDisplay[3] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/JapanMoving/4.gif");
      mapDisplay[4] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/JapanMoving/5.gif");
    } else if (mapchoice == 2) {
      mapDisplay[0] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/BrazilMoving/1.gif");
      mapDisplay[1] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/BrazilMoving/2.gif");
      mapDisplay[2] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/BrazilMoving/3.gif");
      mapDisplay[3] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/BrazilMoving/4.gif");
      mapDisplay[4] = mapDisplay[3];
    } else if (mapchoice==3) {
      mapDisplay[0] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAGMoving/1.gif");
      mapDisplay[1] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAGMoving/2.gif");
      mapDisplay[2] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAGMoving/3.gif");
      mapDisplay[3] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAGMoving/4.gif");
      mapDisplay[4] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAGMoving/5.gif");
    } else if (mapchoice ==4) {
      mapDisplay[0] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAKMoving/1.gif");
      mapDisplay[1] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAKMoving/2.gif");
      mapDisplay[2] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAKMoving/3.gif");
      mapDisplay[3] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAKMoving/4.gif");
      mapDisplay[4] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/USAKMoving/5.gif");
    } else if (mapchoice==5) {
      mapDisplay[0] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/ChinaMoving/1.gif");
      mapDisplay[1] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/ChinaMoving/2.gif");
      mapDisplay[2] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/ChinaMoving/3.gif");
      mapDisplay[3] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/ChinaMoving/4.gif");
      mapDisplay[4] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/ChinaMoving/5.gif");
    } else if (mapchoice==6) {
      mapDisplay[0] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/IndiaMoving/1.gif");
      mapDisplay[1] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/IndiaMoving/2.gif");
      mapDisplay[2] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/IndiaMoving/3.gif");
      mapDisplay[3] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/IndiaMoving/4.gif");
      mapDisplay[4] = loadImage("/Users/mac/Documents/Processing/SF_Final/SF_Backgrounds/IndiaMoving/5.gif");
    }
  } 
  void mapdisplay() { //showing the map and having it be in the central (x length of map is bigger than screen)
    if (mapchoice ==1 || mapchoice==4 || mapchoice==5 ||mapchoice ==6) {
      image(mapDisplay[frameCount%5], -415, 0);
    } else if (mapchoice ==2) {
      image(mapDisplay[frameCount%5], -455, 0);
    } else if (mapchoice ==3) {
      image(mapDisplay[frameCount%5], -494, 0);
    }
  }
  void checkwin() { //if one char is alive, the char alive wins
    if (g.player1.alive == false && g.player2.alive ==true) {
      image(p2win, 400-p2win.width/2, 200);
      g.player1.lose = true; //i had a boolean for lose/win because I wanted to have a death animation/victory animation but time did not permit it
      g.player2.win = true;
    } else if (g.player1.alive == true && g.player2.alive ==false) {
      image(p1win, 400-p1win.width/2, 200);
      g.player1.win = true;
      g.player2.lose = true;
    }
    if (g.player1.win == true || g.player1.lose ==true) {
      play = false; //used to reset game
    }
  }
  void reset() {
    if (play == false && key =='s') { //resetting the game
      play = true;
      g.player1.win = false;
      g.player1.lose = false;
      g.player2.win = false;
      g.player2.lose = false;
      g.player1.alive = true;
      g.player2.alive = true;
      g.player1.wincount = 0;
      g.player2.wincount = 0;
      round = 1;
      charselect1 = false;
      charselect2 = false;
      gamestate = 2;
    }
  }
  void battle() { //method for battle
    if (g.player1.wincount ==3) { //if you win three times in rock paper scissors, you win

      g.player2.alive = false;
    } else if (g.player2.wincount ==3) {
      //timer = millis();
      g.player1.alive = false;
    } else if (g.player1.wincount < 3 && g.player2.wincount <3) {
      if (timer + 6000 < millis()) { //timer countdown and showing text 
        image(shoottext, 400-shoottext.width/2, 200);
      } else if (timer + 5000< millis()) {
        image(scissortext, 400-scissortext.width/2, 200);
      } else if (timer + 4000 <millis()) {
        image(papertext, 400-papertext.width/2, 200);
      } else if (timer + 3000 < millis()) {
        image(rocktext, 400-rocktext.width/2, 200);
      } else {
      }
      if (7000 < millis()-timer) { //after 7 seconds, compares your choice
        if (g.player1.rockp == true && g.player2.scissorp ==false && g.player2.paperp ==false && g.player2.rockp ==false) { 
          //if someone makes a move while the other doesn't, the one who doesn't loses 
          timer = millis(); //used to reset timer 
          g.player2.start_animation_frameCount = g.player2.frame; //used to load animation when you get hit 
          g.player2.hitd = true; //state to know that you're being hit
          g.player2.inAnimation = true; //used to show that you're in animation and cannot do other commands
          g.player1.wincount++; //increment the winner's win count
          round ++;
        } //the rest are all the same but for the various cases 
        if (g.player1.paperp == true && g.player2.scissorp ==false && g.player2.paperp ==false && g.player2.rockp ==false) {
          timer = millis();
          g.player2.start_animation_frameCount = g.player2.frame;
          g.player2.hitd = true;
          g.player2.inAnimation = true;
          g.player1.wincount++;
          round ++;
        }
        if (g.player1.scissorp == true && g.player2.scissorp ==false && g.player2.paperp ==false && g.player2.rockp ==false) {
          timer = millis();
          g.player2.start_animation_frameCount = g.player2.frame;
          g.player2.hitd = true;
          g.player2.inAnimation = true;
          g.player1.wincount++;
          round ++;
        } else if (g.player2.rockp == true && g.player1.paperp ==false && g.player1.rockp == false && g.player1.scissorp ==false) {
          timer = millis();
          g.player1.start_animation_frameCount = g.player1.frame;
          g.player1.hitd = true;
          g.player1.inAnimation = true;
          g.player2.wincount++;
          round ++;
        } else if (g.player2.scissorp == true && g.player1.paperp ==false && g.player1.rockp == false && g.player1.scissorp ==false) {
          timer = millis();
          g.player1.start_animation_frameCount = g.player1.frame;
          g.player1.hitd = true;
          g.player1.inAnimation = true;
          g.player2.wincount++;
          round ++;
        } else if (g.player2.paperp == true && g.player1.paperp ==false && g.player1.rockp == false && g.player1.scissorp ==false) {
          timer = millis();
          g.player1.start_animation_frameCount = g.player1.frame;
          g.player1.hitd = true;
          g.player1.inAnimation = true;
          g.player2.wincount++;
          round ++;
        } else if (g.player1.rockp == true && g.player2.rockp == true) {
          timer = millis();
          g.player1.start_animation_frameCount = g.player1.frame;
          g.player1.hitd = true;
          g.player1.inAnimation = true;
          g.player2.start_animation_frameCount = g.player2.frame;
          g.player2.hitd = true;
          g.player2.inAnimation = true;
        } else if (g.player1.rockp == true && g.player2.paperp ==true) {
          timer = millis();
          g.player1.start_animation_frameCount = g.player1.frame;
          g.player1.hitd = true;
          g.player1.inAnimation = true;
          g.player2.wincount++;
          round ++;
        } else if (g.player1.rockp == true && g.player2.scissorp ==true) {
          timer = millis();
          g.player2.start_animation_frameCount = g.player2.frame;
          g.player2.hitd = true;
          g.player2.inAnimation = true;
          g.player1.wincount++;
          round ++;
        } else if (g.player1.paperp == true && g.player2.rockp ==true) {
          timer = millis();
          g.player2.start_animation_frameCount = g.player2.frame;
          g.player2.hitd = true;
          g.player2.inAnimation = true;
          g.player1.wincount++;
          round ++;
        } else if (g.player1.paperp == true && g.player2.paperp == true) {
          timer = millis();
          g.player1.start_animation_frameCount = g.player1.frame;
          g.player1.hitd = true;
          g.player1.inAnimation = true;
          g.player2.start_animation_frameCount = g.player2.frame;
          g.player2.hitd = true;
          g.player2.inAnimation = true;
        } else if (g.player1.paperp == true && g.player2.scissorp == true) {
          timer = millis();
          g.player1.start_animation_frameCount = g.player1.frame;
          g.player1.hitd = true;
          g.player1.inAnimation = true;
          g.player2.wincount++;
          round ++;
        } else if (g.player1.scissorp == true && g.player2.rockp ==true) {
          timer = millis();
          g.player1.start_animation_frameCount = g.player1.frame;
          g.player1.hitd = true;
          g.player1.inAnimation = true;
          g.player2.wincount++;
          round ++;
        } else if (g.player1.scissorp == true && g.player2.paperp ==true) {
          timer = millis();
          g.player2.start_animation_frameCount = g.player2.frame;
          g.player2.hitd = true;
          g.player2.inAnimation = true;
          g.player1.wincount++;
          round ++;
        } else if (g.player1.scissorp == true && g.player2.scissorp ==true) {
          timer = millis();
          g.player1.start_animation_frameCount = g.player1.frame;
          g.player1.hitd = true;
          g.player1.inAnimation = true;
          g.player2.start_animation_frameCount = g.player2.frame;
          g.player2.hitd = true;
          g.player2.inAnimation = true;
        }
      }
    }
  }
  void battledec() { //loading the battle screen with names on top, wincounts, round #, and which choice you made 
    image(p1font, 30, 10, p1font.width/2, p1font.height/2);
    image(p2font, 770-p2font.width/2, 10, p2font.width/2, p2font.height/2);
    image(charfont1, 30, 15+p1font.height/2, charfont1.width/2, charfont1.height/2);
    image(charfont2, 770-charfont2.width/2, 15+p2font.height/2, charfont2.width/2, charfont2.height/2);
    if (g.player1.wincount ==1) {
      image(victory, 140, 10);
    } else if (g.player1.wincount ==2) {
      image(victory, 140, 10);
      image(victory, 150+victory.width/2, 10);
    } else if (g.player1.wincount ==3) {
      image(victory, 140, 10);
      image(victory, 150+victory.width/2, 10);
      image(victory, 160+victory.width, 10);
    }
    if (g.player2.wincount ==1) {
      image(victory, 560, 10);
    } else if (g.player2.wincount ==2) {
      image(victory, 560, 10);
      image(victory, 570+victory.width/2, 10);
    } else if (g.player2.wincount ==3) {
      image(victory, 560, 10);
      image(victory, 570+victory.width/2, 10);
      image(victory, 580+victory.width, 10);
    }


    if (round ==1) {
      image(r1, 400-r1.width/2, 15);
    } else if (round ==2) {
      image(r2, 400-r1.width/2, 15);
    } else if (round ==3) {
      image(r3, 400-r1.width/2, 15);
    } else if (round ==4) {
      image(r4, 400-r1.width/2, 15);
    } else if (round ==5) {
      image(r5, 400-r1.width/2, 15);
    }

    if (g.player1.rockp == true) { //if choice is rock (p1rockstate ==1), show rock
      image(rock, 390-paper.width, 300);
    } else if (g.player1.paperp == true) {
      image(paper, 390-paper.width, 300);
    } else if (g.player1.scissorp == true) {
      image(scissor, 390-paper.width, 300);
    }
    if (g.player2.rockp == true) {
      image(rock, 410, 300);
    } else if (g.player2.paperp == true) {
      image(paper, 410, 300);
    } else if (g.player2.scissorp == true) {
      image(scissor, 410, 300);
    }
  }
}

Game g;

void pressStart() { //blinking press start
  frameRate(1);
  image(pressStart[frameCount%4], 3*width/4, 10, 71, 13);
}

void selectionp1() { //selection 
//in the beginning, p1 is on player1sel = 1, which is Ryu
  frameRate(15);
  stroke(255, 0, 0);
  strokeWeight(2);
  noFill();
  //for player1
  //if move right, increment player1sel so it becomes the next char  (doesn't work if you're on the most right
  if (p1HandlerRight==true && player1sel != 4 && player1sel !=8) { 
    player1sel ++;
  }
  //same but for left
  if (p1HandlerLeft==true && player1sel != 1 && player1sel !=5) {
    player1sel --;
  }
  if (p1HandlerUp==true && player1sel > 4) {
    player1sel = player1sel-4;
  }
  if (p1HandlerDown == true && player1sel < 5) {
    player1sel = player1sel+4;
  }
  //showing the blinking box around your currently hovered char 
  if (player1sel == 1) {
    if (g.charselect1 == false) {//for blinking box on char when char is not selected
      if (frameCount%2 == 0) {
        rect(xPortrait, yPortrait, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect1 == true) { //if selected, box stops blinking to let you know that you've selected a char
      rect(xPortrait, yPortrait, xSizePortraitInc, ySizePortraitInc);
    }
    //loading the map at the background of player1sel (each char has a different country that they're from, the map for that country lights up 
    map = loadImage("/Users/mac/Documents/Processing/SF_Final/SFworldmap/ehondamap.png");
    image(map, width/2-map.width/5, -70, map.width/(2.5), map.height/(2.5));
    image(charfontsel1, xPortrait+(charfontsel1.width/4)+(player1sel-1)*xSizePortraitInc, yPortrait-(charfontsel1.height/2)-2, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Normal/Ryu.png");
    image(headshot, 0, height-height/2.5, width/4, height/2.5);
    charfont1 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/ryufont.png");
    image(charfont1, 40, 300);
  }
  //same for all other char, just numbers are slightly different to match where they are on the char select box
  if (player1sel == 2) {
    if (g.charselect1 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player1sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect1 == true) {
      rect(xPortrait+(player1sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
    }
    map = loadImage("/Users/mac/Documents/Processing/SF_Final/SFworldmap/ryumap.png");
    image(map, width/2-map.width/5-1, -69.9, map.width/(2.5), map.height/(2.5));
    image(charfontsel1, xPortrait+(charfontsel1.width/4)+(player1sel-1)*xSizePortraitInc, yPortrait-(charfontsel1.height/2)-2, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Normal/EHonda.png");
    image(headshot, 0, height-height/2.5, width/4, height/2.5);
    charfont1 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/ehondafont.png");
    image(charfont1, 0, 300);
  }
  if (player1sel == 3) {
    if (g.charselect1 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player1sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect1 == true) {
      rect(xPortrait+(player1sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
    }
    map = loadImage("/Users/mac/Documents/Processing/SF_Final/SFworldmap/blankamap.png");
    image(map, width/2-map.width/5, -70, map.width/(2.5), map.height/(2.5));
    image(charfontsel1, xPortrait+(charfontsel1.width/4)+(player1sel-1)*xSizePortraitInc, yPortrait-(charfontsel1.height/2)-2, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Normal/Blanka.png");
    image(headshot, 0, height-height/2.5, width/4, height/2.5);
    charfont1 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/blankafont.png");
    image(charfont1, 5, 300);
  }
  if (player1sel == 4) {
    if (g.charselect1 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player1sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect1 == true) {
      rect(xPortrait+(player1sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
    }
    map = loadImage("/Users/mac/Documents/Processing/SF_Final/SFworldmap/guilemap.png");
    image(map, width/2-map.width/5, -70, map.width/(2.5), map.height/(2.5));
    image(charfontsel1, xPortrait+(charfontsel1.width/4)+(player1sel-1)*xSizePortraitInc, yPortrait-(charfontsel1.height/2)-2, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Normal/Guile.png");
    image(headshot, 0, height-height/2.5, width/4, height/2.5);
    charfont1 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/guilefont.png");
    image(charfont1, 15, 300);
  }
  if (player1sel == 5) {
    if (g.charselect1 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player1sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect1 == true) {
      rect(xPortrait+(player1sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
    }
    map = loadImage("/Users/mac/Documents/Processing/SF_Final/SFworldmap/kenmap.png");
    image(map, width/2-map.width/5, -69, map.width/(2.5), map.height/(2.5));
    image(charfontsel1, xPortrait+(charfontsel1.width/4)+(player1sel-5)*xSizePortraitInc, yPortrait-(charfontsel1.height/2)-2+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Normal/Ken.png");
    image(headshot, 0, height-height/2.5, width/4, height/2.5);
    charfont1 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/kenfont.png");
    image(charfont1, 40, 300);
  }
  if (player1sel == 6) {
    if (g.charselect1 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player1sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect1 == true) {
      rect(xPortrait+(player1sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
    }
    map = loadImage("/Users/mac/Documents/Processing/SF_Final/SFworldmap/chuyinmap.png");
    image(map, 0.7+width/2-map.width/5, -71, map.width/(2.5), map.height/(2.5));
    image(charfontsel1, xPortrait+(charfontsel1.width/4)+(player1sel-5)*xSizePortraitInc, yPortrait-(charfontsel1.height/2)-2+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Normal/ChuYi.png");
    image(headshot, 0, height-height/2.5, width/4, height/2.5);
    charfont1 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/chunlifont.png");
    image(charfont1, 5, 300);
  }
  if (player1sel == 7) {
    if (g.charselect1 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player1sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect1 == true) {
      rect(xPortrait+(player1sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
    }
    map = loadImage("/Users/mac/Documents/Processing/SF_Final/SFworldmap/zangiefmap.png");
    image(map, width/2-map.width/5, -69, map.width/(2.5), map.height/(2.5));
    image(charfontsel1, xPortrait+(charfontsel1.width/4)+(player1sel-5)*xSizePortraitInc, yPortrait-(charfontsel1.height/2)-2+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Normal/Zangief.png");
    image(headshot, 0, height-height/2.5, width/4, height/2.5);
    charfont1 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/zangieffont.png");
    image(charfont1, 5, 300);
  }
  if (player1sel == 8) {
    if (g.charselect1 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player1sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect1 == true) {
      rect(xPortrait+(player1sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
    }
    map = loadImage("/Users/mac/Documents/Processing/SF_Final/SFworldmap/dhalismmap.png");
    image(map, 1+width/2-map.width/5, -69, map.width/(2.5), map.height/(2.5));
    image(charfontsel1, xPortrait+(charfontsel1.width/4)+(player1sel-5)*xSizePortraitInc, yPortrait-(charfontsel1.height/2)-2+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Normal/Dhalism.png");
    image(headshot, 0, height-height/2.5, width/4, height/2.5);
    charfont1 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/dhalismfont.png");
    image(charfont1, 0, 300);
  }
}
//for p2
void selectionp2() {//same as above but for p2 
//only difference is the map that is shown --> there aren't images where both maps of the respective players light up so it was a bit more tedious since 
//i had to crop out the country flag and manually place it on the map by testing (so it's hard coded for the country flag placement)
  stroke(31, 0, 255);
  strokeWeight(2);
  noFill();
  if (p2HandlerRight==true && player2sel != 4 && player2sel !=8) {
    player2sel ++;
  }
  if (p2HandlerLeft==true && player2sel != 1 && player2sel !=5) {
    player2sel --;
  }
  if (p2HandlerUp==true && player2sel > 4) {
    player2sel = player2sel-4;
  }
  if (p2HandlerDown == true && player2sel < 5) {
    player2sel = player2sel+4;
  }
  if (player2sel == 1) {
    if (g.charselect2 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait, yPortrait, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect2 == true) {
      rect(xPortrait, yPortrait, xSizePortraitInc, ySizePortraitInc);
    }
    country = loadImage("/Users/mac/Documents/Processing/SF_Final/countries/japan.png");
    image(country, 399, 169, 42, 29.5);
    image(charfontsel2, xPortrait+(charfontsel2.width/4)+(player2sel-1)*xSizePortraitInc, yPortrait-(charfontsel2.height/8)+6+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Reflect/RyuR.png");
    image(headshot2, width-width/4, height-height/2.5, width/4, height/2.5);
    charfont2 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/ryufont.png");
    image(charfont2, width-charfont2.width-40, 300);
  }
  if (player2sel == 2) {
    if (g.charselect2 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player2sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect2 == true) {
      rect(xPortrait+(player2sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
    }
    country = loadImage("/Users/mac/Documents/Processing/SF_Final/countries/japan.png");
    image(country, 422, 94, 42, 29.5);
    image(charfontsel2, xPortrait+(charfontsel2.width/4)+(player2sel-1)*xSizePortraitInc, yPortrait-(charfontsel2.height/8)+6+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Reflect/EHondaR.png");
    image(headshot2, width-width/4, height-height/2.5, width/4, height/2.5);
    charfont2 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/ehondafont.png");
    image(charfont2, width-charfont2.width, 300);
  }
  if (player2sel == 3) {
    if (g.charselect2 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player2sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect2 == true) {
      rect(xPortrait+(player2sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
    }
    country = loadImage("/Users/mac/Documents/Processing/SF_Final/countries/brazil.png");
    image(country, 535.5, 211, 43.5, 32);
    image(charfontsel2, xPortrait+(charfontsel2.width/4)+(player2sel-1)*xSizePortraitInc, yPortrait-(charfontsel2.height/8)+6+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Reflect/BlankaR.png");
    image(headshot2, width-width/4, height-height/2.5, width/4, height/2.5);
    charfont2 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/blankafont.png");
    image(charfont2, width-charfont2.width-5, 300);
  }
  if (player2sel == 4) {
    if (g.charselect2 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player2sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect2 == true) {
      rect(xPortrait+(player2sel-1)*xSizePortraitInc, yPortrait, xSizePortraitInc, ySizePortraitInc);
    }
    country = loadImage("/Users/mac/Documents/Processing/SF_Final/countries/usa.png");
    image(country, 569, 138, 44, 32);
    image(charfontsel2, xPortrait+(charfontsel2.width/4)+(player2sel-1)*xSizePortraitInc, yPortrait-(charfontsel2.height/8)+6+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Reflect/GuileR.png");
    image(headshot2, width-width/4, height-height/2.5, width/4, height/2.5);
    charfont2 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/guilefont.png");
    image(charfont2, width-charfont2.width-15, 300);
  }
  if (player2sel == 5) {
    if (g.charselect2 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player2sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect2 == true) {
      rect(xPortrait+(player2sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
    }
    country = loadImage("/Users/mac/Documents/Processing/SF_Final/countries/usa.png");
    image(country, 561, 48, 44, 30);
    image(charfontsel2, xPortrait+(charfontsel2.width/4)+(player2sel-5)*xSizePortraitInc, yPortrait-(charfontsel2.height/8)+6+ySizePortraitInc+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Reflect/KenR.png");
    image(headshot2, width-width/4, height-height/2.5, width/4, height/2.5);
    charfont2 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/kenfont.png");
    image(charfont2, width-40-charfont2.width, 300);
  }
  if (player2sel == 6) {
    if (g.charselect2 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player2sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect2 == true) {
      rect(xPortrait+(player2sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
    }
    country = loadImage("/Users/mac/Documents/Processing/SF_Final/countries/china.png");
    image(country, 347, 63, 45, 32);
    image(charfontsel2, xPortrait+(charfontsel2.width/4)+(player2sel-5)*xSizePortraitInc, yPortrait-(charfontsel2.height/8)+6+ySizePortraitInc+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Reflect/ChuYiR.png");
    image(headshot2, width-width/4, height-height/2.5, width/4, height/2.5);
    charfont2 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/chunlifont.png");
    image(charfont2, width-5-charfont2.width, 300);
  }
  if (player2sel == 7) {
    if (g.charselect2 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player2sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect2 == true) {
      rect(xPortrait+(player2sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
    }
    country = loadImage("/Users/mac/Documents/Processing/SF_Final/countries/ussr.png");
    image(country, 245, 69, 44, 32);
    image(charfontsel2, xPortrait+(charfontsel2.width/4)+(player2sel-5)*xSizePortraitInc, yPortrait-(charfontsel2.height/8)+6+ySizePortraitInc+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Reflect/ZangiefR.png");
    image(headshot2, width-width/4, height-height/2.5, width/4, height/2.5);
    charfont2 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/zangieffont.png");
    image(charfont2, width+5-charfont2.width, 300);
  }
  if (player2sel == 8) {
    if (g.charselect2 == false) {
      if (frameCount%2 == 0) {
        rect(xPortrait+(player2sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
      }
    } else if (g.charselect2 == true) {
      rect(xPortrait+(player2sel-5)*xSizePortraitInc, yPortrait+ySizePortraitInc, xSizePortraitInc, ySizePortraitInc);
    }
    country = loadImage("/Users/mac/Documents/Processing/SF_Final/countries/india.png");
    image(country, 255, 149, 44, 32);
    image(charfontsel2, xPortrait+(charfontsel2.width/4)+(player2sel-5)*xSizePortraitInc, yPortrait-(charfontsel2.height/8)+6+ySizePortraitInc+ySizePortraitInc, xSizePortraitInc/2, ySizePortraitInc/4);
    headshot2 = loadImage("/Users/mac/Documents/Processing/SF_Final/HeadShots/Reflect/DhalismR.png");
    image(headshot2, width-width/4, height-height/2.5, width/4, height/2.5);
    charfont2 = loadImage("/Users/mac/Documents/Processing/SF_Final/Display/charfonts/dhalismfont.png");
    image(charfont2, width-charfont2.width, 300);
  }
}
