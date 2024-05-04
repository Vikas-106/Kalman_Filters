    
    clc;
    close all;
    
    %% Initialization 
    simulation_time = 1:1:10;
    ground_truth = 5;
    m = ground_truth*(simulation_time>=0);
    noise = zeros(1,length(simulation_time));
    
    min = -2;  %range for adding noise
    max = 2; 
    
    %% Adding random noise 
    for i=1 :length(simulation_time)
        random_number = min + rand * (max - min);
        noise(i) = ground_truth + random_number;
    end
    disp('noise :');
    disp(noise);
    
    %% Kalman filter State estimation
    
    Initial_estimate = 9;
    Error_in_estimate = 3;
    Error_in_measurement = 2;
    Estimate = ones(1,length(simulation_time)+1);
    Estimate(1)= Initial_estimate;
    
    for i = 1 : length(simulation_time)
        
    % Calculating Kalman Gain 
        Kalmain_gain = (Error_in_estimate / (Error_in_estimate + Error_in_measurement));
    
    % Calculating Estimate
        Estimate(i+1) = (Estimate(i) + (Kalmain_gain*(noise(i)-Estimate(i))));
    
    % Calculating Error in Estimate 
        Error_in_estimate = ((1-Kalmain_gain)*(Error_in_estimate));
    end
    
    %% Plotting values 
    
    disp('estimate = ');
    disp(Estimate);
    plot(simulation_time,noise,'r-o');
    hold on;
    plot(simulation_time,m,'g--');
    plot(1:length(Estimate),Estimate,'b--X');
    axis([-1 length(Estimate) 0 10]);
    legend('Ground truth with noise','Ground truth','Estimated value');
