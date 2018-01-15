#include <Servo.h>
Servo servo;

String in = "";
long lattitude = 0, longitude = 0;
  
void setup() 
{
servo.attach(7);
Serial.begin(9600);  
}

void loop()
{
int num; 
if (Serial.available() > 0)
{
num = Serial.read();  
}
if (isDigit(num)) 
{
in += (char)num; 
}
if (num == ',')
{
lattitude = in.toInt();
in = "";
}
if(num == ')')
{
longitude = in.toInt();
in = "";
Serial.print("lattitude: "); 
Serial.print(lattitude);
Serial.print(", longitude: ");
Serial.println(longitude);
in = "";
int analogin;
int analogout;
analogin=analogRead(A0);
if(lattitude < 1192359 && longitude < 7673982)
{
analogout = analogin;
analogout = map(analogout, 0, 1023, 0, 90);
servo.write(analogout); 
delay(15);
//Serial.println(analogout);
}
else if(lattitude < 1253926 && longitude < 7782654)
{
if(analogin<800)
{
analogout = analogin;
analogout = map(analogout, 0, 1023, 0, 90);
servo.write(analogout); 
delay(15);
}
else
{
analogout=800;
analogout = map(analogout, 0, 1023, 0, 90);
servo.write(analogout); 
delay(15);
//Serial.print("limited to  ");
//Serial.print(analogout);
}
}
else if(lattitude < 1373925 && longitude < 7892563)
{
if(analogin<700)
{
analogout = analogin;
analogout = map(analogout, 0, 1023, 0, 90);
servo.write(analogout); 
delay(15);
}
else
{
analogout=700;
analogout = map(analogout, 0, 1023, 0, 90);
servo.write(analogout); 
delay(15);
//Serial.print("limited to  ");
//Serial.print(analogout);
}
}
else
{
analogout = analogin;
analogout = map(analogout, 0, 1023, 0, 90);
servo.write(analogout); 
delay(15);
//Serial.println(analogout);
}
}
}
