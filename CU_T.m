clear all;
a = load("straingauge.mat");
A = struct2array(a);
g(1) = 0;
g1(1) = 0;
n = 3000; % Normal value
var = 1; % Variance
c = 0;
% Threshold is taken as [20, -20]

% +ve CUSUM each observation
for t = 2:length(A) + 1
    s(t-1) = (A(t-1)-n)/var;
    g(t) = g(t-1) + s(t-1);
    % -ve CUSUM each observation
    if c == 0
        for t1 = 2:length(A) + 1
            s1(t1-1) = (A(t1-1)-n)/var;
            g1(t1) = g1(t1-1) + s1(t1-1);
            if g1(t1) > 0
                g1(t1) = 0;
            end
            % Decision Rule
            if g1(t1) < -20 % Threshold
                display('-ve_fault, take action')
                c = 1;
                break
            end
        end
    end
    if g(t) < 0
        g(t) = 0;
    end
    % Decision Rule
    if g(t) > 20 % Threshold
        display('+ve_fault take action')
        break
    end
end
% Plotting
plot(A);
hold on;
yline(median(A));
hold on;
plot((median(A)+g1))
hold on;
plot((median(A)+g));
hold on;
yline(median(A)-20,'g');
hold on;
yline(median(A)+20,'g')
legend('Data','median','-ve Fault','+ve Fault','threshold')
