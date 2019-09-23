import controlP5.*; //import ControlP5 library
import processing.serial.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
Serial myPort;  // Create object from Serial class
ControlP5 cp5; //create ControlP5 object
PFont font;
int defaultSpanishColor = 150;//number for red;
int defaultMandarinColor = 175;//number for blue
int defaultGermanColor = 200;//number for green
int defaultRed = 0;
int defaultBlue = 0;
int defaultGreen = 0;
int languageIndex = 0;
int phraseIndex = 0;
int count = 3;
AudioPlayer [] spanishMP3 = new AudioPlayer[count];
AudioPlayer [] mandarinMP3 = new AudioPlayer[count];
AudioPlayer [] germanMP3 = new AudioPlayer[count];

void setup() 
{ 
  size(600, 450);    //window size, (width, height)
  printArray(Serial.list());   //prints all available serial ports
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.clear();
  minim = new Minim(this);
  cp5 = new ControlP5(this);
  font = createFont("calibri light bold", 20);    // custom fonts for buttons and title
  
  cp5.addButton("Spanish")     //"Hello" is the name of button
    .setPosition(100, 50)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
    .setColorBackground(color(255, 0, 0))
  ;   

  cp5.addButton("Mandarin")     //"How are you" is the name of button
    .setPosition(100, 200)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
    .setColorBackground(color(0, 0, 255))
  ;

  cp5.addButton("German")     //"Goodbye" is the name of button
    .setPosition(100, 350)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
    .setColorBackground(color(0, 255, 0))
  ;
  
    cp5.addButton("Hello")     //"Hello" is the name of button
    .setPosition(400, 50)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
    .setColorBackground(color(0, 153, 153))
  ;
  
      cp5.addButton("How_Are_You")     //"How Are You" is the name of button
    .setPosition(400, 200)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
    .setColorBackground(color(0, 153, 153))
  ;
  
      cp5.addButton("Goodbye")     //"Goodbye" is the name of button
    .setPosition(400, 350)  //x and y coordinates of upper left corner of button
    .setSize(120, 70)      //(width, height)
    .setFont(font)
    .setColorBackground(color(0, 153, 153))
  ;
  
  
  spanishMP3[0] = minim.loadFile("hellospanish.mp3");
  spanishMP3[1] = minim.loadFile("howareyouspanish.mp3");
  spanishMP3[2] = minim.loadFile("goodbyespanish.mp3");
  
  mandarinMP3[0] = minim.loadFile("hellomandarin.mp3");
  mandarinMP3[1] = minim.loadFile("howareyoumandarin.mp3");
  mandarinMP3[2] = minim.loadFile("goodbyemandarin.mp3");
  
  germanMP3[0] = minim.loadFile("hellogerman.mp3");
  germanMP3[1] = minim.loadFile("howareyougerman.mp3");
  germanMP3[2] = minim.loadFile("goodbyegerman.mp3");
}

void draw() {
  background(defaultRed, defaultGreen , defaultBlue); // background color of window (r, g, b) or (0 to 255)
  //lets give title to our window
  fill(255, 255, 51);               //text color (r, g, b)
  textFont(font);
  text("Choose your language:", 30, 30);// ("text", x coordinate, y coordinate)
  text("Choose your phrase:", 325, 30);
   // check if there is something new on the serial port
   if(languageIndex == 1)
   {
    if(phraseIndex == 1)
    {
     spanishMP3[phraseIndex-1].rewind(); 
     spanishMP3[phraseIndex-1].play(); 
     myPort.write('a');
     phraseIndex = 0;
    }
    
    if(phraseIndex == 2)
    {
     spanishMP3[phraseIndex-1].rewind(); 
     spanishMP3[phraseIndex-1].play();
     myPort.write('b');
     phraseIndex = 0;
    }
    
    if(phraseIndex == 3)
    {
     spanishMP3[phraseIndex-1].rewind(); 
     spanishMP3[phraseIndex-1].play();
     myPort.write('c');
     phraseIndex = 0;
    } 
   }
   
   if(languageIndex == 2)
   {
    if(phraseIndex == 1)
    { 
     mandarinMP3[phraseIndex-1].rewind(); 
     mandarinMP3[phraseIndex-1].play();
     myPort.write('d');
     phraseIndex = 0;
    }
    
    if(phraseIndex == 2)
    {
     mandarinMP3[phraseIndex-1].rewind(); 
     mandarinMP3[phraseIndex-1].play(); 
     myPort.write('e');
     phraseIndex = 0;
    }
    
    if(phraseIndex == 3)
    {
     mandarinMP3[phraseIndex-1].rewind(); 
     mandarinMP3[phraseIndex-1].play(); 
     myPort.write('f');
     phraseIndex = 0;
    }
   }
   
   if(languageIndex == 3)
   { 
    if(phraseIndex == 1)
    { 
     germanMP3[phraseIndex-1].rewind(); 
     germanMP3[phraseIndex-1].play(); 
     myPort.write('g');
     phraseIndex = 0;
    }
    
    if(phraseIndex == 2)
    { 
     germanMP3[phraseIndex-1].rewind(); 
     germanMP3[phraseIndex-1].play(); 
     myPort.write('h');
     phraseIndex = 0;
    }
    
    if(phraseIndex == 3)
    { 
     germanMP3[phraseIndex-1].rewind(); 
     germanMP3[phraseIndex-1].play(); 
     myPort.write('i');
     phraseIndex = 0;
    }
  } 
}

void Spanish()
{
 languageIndex = 1; 
 println("Spanish selected");
 //myPort.write('s'); //send a S
 defaultRed = 255;
 defaultBlue = 0;
 defaultGreen = 0;
}
void Mandarin()
{
 languageIndex = 2;
 println("Mandarin selected");
 //myPort.write('m'); //send an M
 defaultBlue = 255;
 defaultGreen = 0; 
 defaultRed = 0;
} 
void German()
{
 languageIndex = 3; 
 println("German selected");
 //myPort.write('g'); //send a G
 defaultGreen = 255;
 defaultBlue = 0; 
 defaultRed = 0;
} 
void Hello()
{
 phraseIndex = 1; 
 println("Hello selected");
}

void How_Are_You()
{
 phraseIndex = 2;  
 println("How are you selected"); 
}

void Goodbye()
{
 phraseIndex = 3;  
 println("Goodbye selected"); 
}