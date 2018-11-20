#include "Arduino.h"
#include <Adafruit_SoftServo.h>

#define SERVOPIN 4 // Pin for the ESC controller

#define POTPIN 3  // analog pin used to connect the potentiometer

Adafruit_SoftServo servo;

void setup() {
  OCR0A = 0xAF;             // any number is OK
  TIMSK |= _BV(OCIE0A);     // Turn on the compare interrupt (below!)
  servo.attach(SERVOPIN);

  servo.write(180);
  delay(10000);
  servo.write(0);
  delay(10000);
}

void loop() {
  int potValue;
  int speed;
  potValue = analogRead(POTPIN);
  speed = map(potValue, 0, 1023, 0, 180);
  servo.write(speed);
  delay(15);
}

volatile uint8_t counter = 0;
SIGNAL(TIMER0_COMPA_vect) {
  counter += 2;
  if (counter >= 20) {
    counter = 0;
    servo.refresh();
  }
}
