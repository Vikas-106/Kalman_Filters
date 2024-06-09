close all
clc

%% Initializing

no_of_samples = 100;
mean = 0;
R = 2; % Variance 
dt = 0.01;

t = 0:dt:no_of_samples*dt;

x = 0; % initial x distance 
v_x = 1; % velocity
a = 1; % Acceleration 
 
x_truth = zeros(2,length(t)); % Initialize ground truth 
x_truth(:,1) = [x; v_x];

%%  Adding noise
noise_x = zeros(2,length(t));  % Initialize noise_x array

for i = 2:length(t)
  
    x_truth(:,i) = x_truth(:,i-1) + v_x.*dt + 0.5*a.*dt; % Generating ground truth

    noise = R * randn(2,1);  
    noise_x(:,i) = x_truth(:,i) + noise;  % Add noise to x_truth
end

%% Kalman Filter 

X = zeros(2,length(t)); % X position

X(:,1) = [1 ; 3];

P = [25 0 ; 
     0  3]; % Covariance 


A = [1 dt;
     0 1];

B = [ 0.5*dt*dt ;
      dt        ];

H = [1 0;
     0 1];

R = [4 0; 
     0 6 ];

C = eye(2);

Q = [ 0 0 
      0 0];

for i = 2:length(t)
    
    X(:,i) = A*X(:,i-1) + B*a;
     
    P = A*P*A' + Q;

    K = P*H' / (H*P*H' + R);

    X(:,i) = X(:,i) + K*(noise_x(:,i) - H*X(:,i));

    P = (eye(2) - K*H)*P;

end

%% Plotting 

for i = 1:length(t)
    plot(t(1:i), x_truth(1,1:i), 'b', 'LineWidth', 2);
    hold on;
    plot(t(1:i), noise_x(1,1:i), '.r', 'LineWidth', 2);
    plot(t(1:i), X(1,1:i), 'g', 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Position');
    title('Position vs. Time Animation');
    legend('Ground Truth', 'With Noise', 'Estimated');
    hold off;
    grid on;
    drawnow;
    pause(0.01);
end 
 