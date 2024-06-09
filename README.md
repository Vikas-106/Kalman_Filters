# KALMAN FILTER FOR SINGLE GROUND TRUTH (1D)

Let say we have a Thermometer which says the temperature of a person but the measured value has some nosie , Here the ground truth is just a single value , not a time varying value in this case we take 
a single ground truth value (which is shown in green color) and is measured with some noise (which is red in color) then by using __kalman filter__ we get the real ground truth value but estiamating its actual value with the samples provided .

The below graph shows the estimation for fewer samples 

![Screenshot from 2024-05-03 14-50-25](https://github.com/Vikas-106/Kalman_Filters/assets/132147293/546acb94-673e-4c66-abe0-9b00dd45eb02)

You get more accurate estimation when increasing the samples 

![Screenshot from 2024-05-03 14-52-16](https://github.com/Vikas-106/Kalman_Filters/assets/132147293/46d78659-be36-495f-a15d-787260b30ae0)

# KALMAN FILTER FOR A CONSTANT TIME VARYING GROUND TRUTH IN SINGLE AXIS 

Here lets take a simple car example which goes in x direction with a constant velocity 'V' and acceleration 'A' , now we have the reading of the current position of the car with some sensor measurement but it has noise , So we implement Kalman filter here to predict the actual X position of the car over time with the noise measurements . The red dots are the noise measurement which we got from the sensor and the green line is the estimated x position 


https://github.com/Vikas-106/Kalman_Filters/assets/132147293/0e78d28d-c11c-4cc5-884e-a516ae2158da

