clear all;
a = load("straingauge.mat");
A = struct2array(a);
g(1) = 0;
g1(1) = 0;
n = 3000; % Normal value
var = 1; % Variance
% Threshold is taken as [20, -20]

% +ve CUSUM each observation
for t = 2:length(A) + 1
    s(t-1) = (A(t-1)-n)/var;
    g(t) = g(t-1) + s(t-1);
    if g(t) < 0
        g(t) = 0;
    end
    % Decision Rule
    if g(t) > 20 % Threshold
        display('+ve_fault')
        break
    end
end
% -ve CUSUM each observation
for t = 2:length(A) + 1
    s(t-1) = (A(t-1)-n)/var;
    g1(t) = g1(t-1) + s(t-1);
    if g1(t) > 0
        g1(t) = 0;
    end
    % Decision Rule
    if g1(t) < -20 % Threshold
        display('-ve_fault')
        break
    end
   
end

% Plotting
figure;
plot(A);
hold on;
yline(median(A));
hold on;
plot((median(A)+g1))
hold on;
plot((median(A)+g))
legend('Data','yline','-ve Fault','+ve Fault')



