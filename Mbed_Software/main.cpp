#include "mbed.h"
#include "VL53L0X.h"
#include "Servo.h"

Serial pc(USBTX, USBRX);
VL53L0X tof = VL53L0X(p9,p10);
Servo myservo(p21);



int main() {
    
    myservo.calibrate(0.0015, 90.0);
    if (!tof.init()){
        pc.printf("Failed to boot VL53L0X");
        return 1;
    }
    int distance = 0;
    tof.startContinuous();
    while(1){
        for (int i = 0; i < 100; i ++){
            myservo = i/100.0;
            distance = tof.readRangeContinuousMillimeters();
            pc.printf("%i,%f\n\r", distance, i/100.0);
            wait(0.1);
        }
        wait(0.2);
        for (int j = 100; j > 0; j--){
            myservo = j/100.0;
            distance = tof.readRangeContinuousMillimeters();
            pc.printf("%i, %f\n\r", distance, j/100.0);
            wait(0.1);
        }
        
        wait(0.1);
    }
}

