clear all;
a = load("encoder.mat");
A = struct2array(a);
T = length(A);
b = A(1:5,:);
% Noise
var_n = 9;
%% Uniform Distribution of prior
% Uniform distribution between 0-30 (Delta)
min = 0;
max = 30;
% Function for numerator
f1 = @(x)(x/sqrt(2 * pi *(var_n/T))) .* exp(-((1/(2 * (var_n/T))) .* (x - mean(A)).^2));
% Function for denominator
f2 = @(x)(1/sqrt(2 * pi *(var_n/T))) .* exp(-((1/(2 * (var_n/T))) .* (x - mean(A)).^2));
% MMSE
F1 = integral(f1,min,max);
F2 = integral(f2,min,max);
F = F1/F2;
disp(F)

% First five elements
n_f1 = @(x)(x/sqrt(2 * pi *(var_n/5))) .* exp(-((1/(2 * (var_n/5))) .* (x - mean(b)).^2));
n_f2 = @(x)(1/sqrt(2 * pi *(var_n/5))) .* exp(-((1/(2 * (var_n/5))) .* (x - mean(b)).^2));
n_F1 = integral(n_f1,min,max);
n_F2 = integral(n_f2,min,max);
n_F = n_F1/n_F2;
disp(n_F)

%% Gaussian Distribution of prior
m = 15; % mean
var = 4; % variance
% Prrior Data
p = ((var_n/T)/(var + (var_n/T))) * m;
% Given data
d = ((var)/(var + (var_n/T))) * mean(A);
% MMSE
M = p + d;
disp(M)

% First five
n_p = ((var_n/5)/(var + (var_n/5))) * m;
n_d = ((var)/(var + (var_n/5))) * mean(b);
n_M = n_p + n_d;
disp(n_M)

%% Sequential Estimation
m = 15; % mean
var = 4; % variance
T = length(A) - 1;
% Taking each data in sequential form
for i = 1:T+1
    s(i) = sum(A(1:i,:));
    % Prrior Data
    P = ((var_n)/(var*i + var_n)) * m;
    % Given data
    D = ((var)/(var*i + var_n)) * s(i);
    % MMSE
    s_M = P + D;
end

disp(s_M)

% First five
for i = 1:4+1
    s(i) = sum(A(1:i,:));
    n_P = ((var_n)/(var*i + var_n)) * m;
    n_D = ((var)/(var*i + var_n)) * s(i);
    n_sM = n_P + n_D;
end

disp(n_sM)
