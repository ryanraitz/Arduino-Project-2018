//Arduino Final Project
//Created by Ryan Raitz

#include <LiquidCrystal.h>

LiquidCrystal lcd(13, 12, 11, 10, 9, 8);

char val;

void setup() 
{
  //set the button pins as inputs
  lcd.begin(16,2); 
  lcd.clear();
  
  Serial.begin(9600);
}
void loop()
{
lcd.setCursor(0,0);   
if (Serial.available()) // If data is available to read,
{      
     val = Serial.read(); // read it and store it in val 
}
     
if(val == 'a')
{ 
lcd.clear();  
lcd.print("Hola");   
}
if(val=='b')
{ 
lcd.clear();  
lcd.print("Como estas?");    
}
if(val=='c')
{
lcd.clear();   
lcd.print("Adios");    
}
if(val=='d')
{ 
lcd.clear();  
lcd.print("Ni hao");    
}
if(val=='e')
{
lcd.clear();   
lcd.print("Ni hao ma?");    
}
if(val=='f')
{ 
lcd.clear();  
lcd.print("Zaijian");   
}
if(val=='g')
{
lcd.clear();   
lcd.print("Hallo");    
}
if(val=='h')
{ 
lcd.clear();  
lcd.print("Wie geht es dir?");   
}
if(val=='i')
{
lcd.clear();   
lcd.print("Auf wiedersehen");    
}

}

