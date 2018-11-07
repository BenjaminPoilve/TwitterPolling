#include <Servo.h>
Servo myservo_0; // create servo object to control a servo
Servo myservo_1; // a maximum of eight servo objects can be created
int posA= 0; // variable to store the servo position
int posB=40;
void setup()
{
     Serial.begin(9600);  
myservo_0.attach(3);
myservo_1.attach(5);

myservo_0.write(10);
delay(100);
myservo_1.write(0);
Serial.println("running");


}
void loop(){
  delay(100);
      if (Serial.available() > 0) {
    char ch=Serial.read();
    if(ch>='0' && ch<='9'){
      if(ch=='1'){
        moveone();
      }
      if(ch=='2'){
        movetwo();

      }
     }
     
    }
  
} 
  
  
void moveone(){
myservo_0.write(38);
delay(180);

 
myservo_0.write(10);
delay(100);

}


void movetwo(){

myservo_1.write(35);
delay(180);

 
myservo_1.write(0);
delay(100);

}

