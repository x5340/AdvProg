#include "mbed.h"
#include "VL53L0X.h"
#include "Servo.h"

Serial pc(USBTX, USBRX);
VL53L0X tof = VL53L0X(p9,p10);
Servo myservo(p21);

volatile bool FidgetSpinner;

int main() {
    
    myservo.calibrate(0.0010, 90.0);
    if (!tof.init()){
        pc.printf("Failed to boot VL53L0X");
        return 1;
    }
    int distance = 0;
    tof.startContinuous();
    while(1){
        for (uint16_t i = 0; i < 180; i+=1){
            myservo = (double)i/180.0;
            
            
            //pc.printf("%i,%f\n\r", distance, i/100.0);
            
            while(!pc.readable()){
                    //while the pc is not readable, we will wait.
                    FidgetSpinner = !FidgetSpinner; //volatile bool ensures no optimization , we have to run this loop
            }
            
            while(pc.readable()){
                FidgetSpinner = !FidgetSpinner;
                char trash = pc.getc();    
            }
            
            distance = tof.readRangeContinuousMillimeters();
            uint16_t distance16_t = (uint16_t)distance;
            char* iterator = (char*) &distance16_t ;
            //pc.printf("distance byte0 = %x\n\r", iterator[0]);
            while(!pc.writeable()){
                FidgetSpinner = !FidgetSpinner;    
            }
            pc.putc(iterator[0]);
            //pc.printf("distance byte1 = %x\n\r", iterator[1]);
            while(!pc.writeable()){
                FidgetSpinner = !FidgetSpinner;    
            }
            pc.putc(iterator[1]);
            
            uint16_t angle16_t = i;
            iterator = (char*) &angle16_t;
            //pc.printf("angle byte0 = %x\n\r", iterator[0]);
            while(!pc.writeable()){
                FidgetSpinner = !FidgetSpinner;    
            }
            pc.putc(iterator[0]);
            //pc.printf("angle byte1 = %x\n\r", iterator[1]);
            while(!pc.writeable()){
                FidgetSpinner = !FidgetSpinner;    
            }
            pc.putc(iterator[1]);
        }
        for (uint16_t j = 180; j > 0; j-=1){
            myservo = (double)j/180.0;
            
            
            //pc.printf("%j,%f\n\r", distance, i/100.0);
            
            while(!pc.readable()){
                    //while the pc is not readable, we will wait.
                    FidgetSpinner = !FidgetSpinner; //volatile bool ensures no optimization , we have to run this loop
            }
            
            while(pc.readable()){
                FidgetSpinner = !FidgetSpinner;
                char trash = pc.getc();    
            }
            
            distance = tof.readRangeContinuousMillimeters();
            uint16_t distance16_t = (uint16_t)distance;
            char* iterator = (char*) &distance16_t ;
            //pc.printf("distance byte0 = %x\n\r", iterator[0]);
            while(!pc.writeable()){
                FidgetSpinner = !FidgetSpinner;    
            }
            pc.putc(iterator[0]);
            //pc.printf("distance byte1 = %x\n\r", iterator[1]);
            while(!pc.writeable()){
                FidgetSpinner = !FidgetSpinner;    
            }
            pc.putc(iterator[1]);
            
            uint16_t angle16_t = j;
            iterator = (char*) &angle16_t;
            //pc.printf("angle byte0 = %x\n\r", iterator[0]);
            while(!pc.writeable()){
                FidgetSpinner = !FidgetSpinner;    
            }
            pc.putc(iterator[0]);
            while(!pc.writeable()){
                FidgetSpinner = !FidgetSpinner;    
            }
            //pc.printf("angle byte1 = %x\n\r", iterator[1]);
            pc.putc(iterator[1]);
        }
    }
}
