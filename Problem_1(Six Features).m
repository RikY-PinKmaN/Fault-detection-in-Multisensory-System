%% Feature Extraction
clear all;
% Bearing
a = load('bearing.mat');
a1 = struct2array(a);
A = reshape(a1,[1000,50]);
for j=1:50
    A1(:,j) = A(:,j)- mean(A(:,j));
end
% F1 Data
[B1,C1]= butter(7,0.05,"low");
y= filter(B1,C1,A1);
[P1,f1]= pwelch(y,[],[],[],1000);
% F2 Data
[B1,C1]= butter(6,[0.05,0.1]);
y1= filter(B1,C1,A1);
[P2,f2]= pwelch(y1,[],[],[],1000);
% F3 Data
[B2,C2]= butter(9,[0.1,0.2]);
y2= filter(B2,C2,A1);
[P3,f3]= pwelch(y2,[],[],[],1000);
% F4 Data
[B3,C3]= butter(8,[0.2,0.4]);
y3= filter(B3,C3,A1);
[P4,f4]= pwelch(y3,[],[],[],1000);
% F5 Data
[B1,C1]= butter(9,[0.4,0.7]);
y4= filter(B1,C1,A1);
[P5,f5]= pwelch(y4,[],[],[],1000);
% F6 Data
[B1,C1]= butter(16,0.7,"high");
y5= filter(B1,C1,A1);
[P6,f6]= pwelch(y5,[],[],[],1000);
for j=1:50
    P1i(:,j)= norm(P1(:,j),2);
    N= length(P1);
    F1_b = P1i./sqrt(N); % F1
    P2i(:,j)= norm(P2(:,j),2);
    N= length(P2);
    F2_b = P2i./sqrt(N); % F2
    P3i(:,j)= norm(P3(:,j),2);
    N= length(P3);
    F3_b = P3i./sqrt(N); % F3
    P4i(:,j)= norm(P4(:,j),2);
    N= length(P4);
    F4_b = P4i./sqrt(N); % F4
    P5i(:,j)= norm(P5(:,j),2);
    N= length(P5);
    F5_b = P5i./sqrt(N); % F5
    P6i(:,j)= norm(P6(:,j),2);
    N= length(P6);
    F6_b = P6i./sqrt(N); % F6
end
% Gearmesh
a = load('gearmesh.mat');
a1 = struct2array(a);
A = reshape(a1,[1000,50]);
for j=1:50
    A1(:,j) = A(:,j)- mean(A(:,j));
end
% F1 Data
[B1,C1]= butter(7,0.05,"low");
y= filter(B1,C1,A1);
[P1,f1]= pwelch(y,[],[],[],1000);
% F2 Data
[B1,C1]= butter(6,[0.05,0.1]);
y1= filter(B1,C1,A1);
[P2,f2]= pwelch(y1,[],[],[],1000);
% F3 Data
[B2,C2]= butter(9,[0.1,0.2]);
y2= filter(B2,C2,A1);
[P3,f3]= pwelch(y2,[],[],[],1000);
% F4 Data
[B3,C3]= butter(8,[0.2,0.4]);
y3= filter(B3,C3,A1);
[P4,f4]= pwelch(y3,[],[],[],1000);
% F5 Data
[B1,C1]= butter(9,[0.4,0.7]);
y4= filter(B1,C1,A1);
[P5,f5]= pwelch(y4,[],[],[],1000);
% F6 Data
[B1,C1]= butter(16,0.7,"high");
y5= filter(B1,C1,A1);
[P6,f6]= pwelch(y5,[],[],[],1000);
for j=1:50
    P1i(:,j)= norm(P1(:,j),2);
    N= length(P1);
    F1_g = P1i./sqrt(N); % F1
    P2i(:,j)= norm(P2(:,j),2);
    N= length(P2);
    F2_g = P2i./sqrt(N); % F2
    P3i(:,j)= norm(P3(:,j),2);
    N= length(P3);
    F3_g = P3i./sqrt(N); % F3
    P4i(:,j)= norm(P4(:,j),2);
    N= length(P4);
    F4_g = P4i./sqrt(N); % F4
    P5i(:,j)= norm(P5(:,j),2);
    N= length(P5);
    F5_g = P5i./sqrt(N); % F5
    P6i(:,j)= norm(P6(:,j),2);
    N= length(P6);
    F6_g = P6i./sqrt(N); % F6
end
% Misalignment
a = load('misalignment.mat');
a1 = struct2array(a);
A = reshape(a1,[1000,50]);
for j=1:50
    A1(:,j) = A(:,j)- mean(A(:,j));
end
% F1 Data
[B1,C1]= butter(7,0.05,"low");
y= filter(B1,C1,A1);
[P1,f1]= pwelch(y,[],[],[],1000);
% F2 Data
[B1,C1]= butter(6,[0.05,0.1]);
y1= filter(B1,C1,A1);
[P2,f2]= pwelch(y1,[],[],[],1000);
% F3 Data
[B2,C2]= butter(9,[0.1,0.2]);
y2= filter(B2,C2,A1);
[P3,f3]= pwelch(y2,[],[],[],1000);
% F4 Data
[B3,C3]= butter(8,[0.2,0.4]);
y3= filter(B3,C3,A1);
[P4,f4]= pwelch(y3,[],[],[],1000);
% F5 Data
[B1,C1]= butter(9,[0.4,0.7]);
y4= filter(B1,C1,A1);
[P5,f5]= pwelch(y4,[],[],[],1000);
% F6 Data
[B1,C1]= butter(16,0.7,"high");
y5= filter(B1,C1,A1);
[P6,f6]= pwelch(y5,[],[],[],1000);
for j=1:50
    P1i(:,j)= norm(P1(:,j),2);
    N= length(P1);
    F1_m = P1i./sqrt(N); % F1
    P2i(:,j)= norm(P2(:,j),2);
    N= length(P2);
    F2_m = P2i./sqrt(N); % F2
    P3i(:,j)= norm(P3(:,j),2);
    N= length(P3);
    F3_m = P3i./sqrt(N); % F3
    P4i(:,j)= norm(P4(:,j),2);
    N= length(P4);
    F4_m = P4i./sqrt(N); % F4
    P5i(:,j)= norm(P5(:,j),2);
    N= length(P5);
    F5_m = P5i./sqrt(N); % F5
    P6i(:,j)= norm(P6(:,j),2);
    N= length(P6);
    F6_m = P6i./sqrt(N); % F6
end
% Imbalance
a = load('imbalance.mat');
a1 = struct2array(a);
A = reshape(a1,[1000,50]);
for j=1:50
    A1(:,j) = A(:,j)- mean(A(:,j));
end
% F1 Data
[B1,C1]= butter(7,0.05,"low");
y= filter(B1,C1,A1);
[P1,f1]= pwelch(y,[],[],[],1000);
% F2 Data
[B1,C1]= butter(6,[0.05,0.1]);
y1= filter(B1,C1,A1);
[P2,f2]= pwelch(y1,[],[],[],1000);
% F3 Data
[B2,C2]= butter(9,[0.1,0.2]);
y2= filter(B2,C2,A1);
[P3,f3]= pwelch(y2,[],[],[],1000);
% F4 Data
[B3,C3]= butter(8,[0.2,0.4]);
y3= filter(B3,C3,A1);
[P4,f4]= pwelch(y3,[],[],[],1000);
% F5 Data
[B1,C1]= butter(9,[0.4,0.7]);
y4= filter(B1,C1,A1);
[P5,f5]= pwelch(y4,[],[],[],1000);
% F6 Data
[B1,C1]= butter(16,0.7,"high");
y5= filter(B1,C1,A1);
[P6,f6]= pwelch(y5,[],[],[],1000);
for j=1:50
    P1i(:,j)= norm(P1(:,j),2);
    N= length(P1);
    F1_i = P1i./sqrt(N); % F1
    P2i(:,j)= norm(P2(:,j),2);
    N= length(P2);
    F2_i = P2i./sqrt(N); % F2
    P3i(:,j)= norm(P3(:,j),2);
    N= length(P3);
    F3_i = P3i./sqrt(N); % F3
    P4i(:,j)= norm(P4(:,j),2);
    N= length(P4);
    F4_i = P4i./sqrt(N); % F4
    P5i(:,j)= norm(P5(:,j),2);
    N= length(P5);
    F5_i = P5i./sqrt(N); % F5
    P6i(:,j)= norm(P6(:,j),2);
    N= length(P6);
    F6_i = P6i./sqrt(N); % F6
end
% Resonance
a = load('resonance.mat');
a1 = struct2array(a);
A = reshape(a1,[1000,50]);
for j=1:50
    A1(:,j) = A(:,j)- mean(A(:,j));
end
% F1 Data
[B1,C1]= butter(7,0.05,"low");
y= filter(B1,C1,A1);
[P1,f1]= pwelch(y,[],[],[],1000);
% F2 Data
[B1,C1]= butter(6,[0.05,0.1]);
y1= filter(B1,C1,A1);
[P2,f2]= pwelch(y1,[],[],[],1000);
% F3 Data
[B2,C2]= butter(9,[0.1,0.2]);
y2= filter(B2,C2,A1);
[P3,f3]= pwelch(y2,[],[],[],1000);
% F4 Data
[B3,C3]= butter(8,[0.2,0.4]);
y3= filter(B3,C3,A1);
[P4,f4]= pwelch(y3,[],[],[],1000);
% F5 Data
[B1,C1]= butter(9,[0.4,0.7]);
y4= filter(B1,C1,A1);
[P5,f5]= pwelch(y4,[],[],[],1000);
% F6 Data
[B1,C1]= butter(16,0.7,"high");
y5= filter(B1,C1,A1);
[P6,f6]= pwelch(y5,[],[],[],1000);
for j=1:50
    P1i(:,j)= norm(P1(:,j),2);
    N= length(P1);
    F1_r = P1i./sqrt(N); % F1
    P2i(:,j)= norm(P2(:,j),2);
    N= length(P2);
    F2_r = P2i./sqrt(N); % F2
    P3i(:,j)= norm(P3(:,j),2);
    N= length(P3);
    F3_r = P3i./sqrt(N); % F3
    P4i(:,j)= norm(P4(:,j),2);
    N= length(P4);
    F4_r = P4i./sqrt(N); % F4
    P5i(:,j)= norm(P5(:,j),2);
    N= length(P5);
    F5_r = P5i./sqrt(N); % F5
    P6i(:,j)= norm(P6(:,j),2);
    N= length(P6);
    F6_r = P6i./sqrt(N); % F6
end
%% Data Visualization
Fault_1= [F1_b; F2_b; F3_b; F4_b; F5_b; F6_b]';
Fault_2= [F1_g; F2_g; F3_g; F4_g; F5_g; F6_g]';
Fault_3= [F1_m; F2_m; F3_m; F4_m; F5_m; F6_m]';
Fault_4= [F1_i; F2_i; F3_i; F4_i; F5_i; F6_i]';
Fault_5= [F1_r; F2_r; F3_r; F4_r; F5_r; F6_r]';
G= [Fault_1; Fault_2; Fault_3; Fault_4; Fault_5];
c=corrcoef(G); % Calculates a correlation coefficient matrix c of G
[v,d] =eig(c); % Find the eigenvectors v and the eigenvalues d of G
T=[ v(:,end)';v(:,end-1)']; % Create the transformation matrix T from
% the first two principal components
z=T*G'; % Create a 2-dimensional feature vector z
figure;
% Scatter plot of the 2-dimensional features
scatter(z(1,1:50), z(2,1:50),'green')
hold on
scatter(z(1,51:100), z(2,51:100),'red')
hold on
scatter(z(1,101:150), z(2,101:150),'blue')
hold on
scatter(z(1,151:200), z(2,151:200),'magenta')
hold on
scatter(z(1,201:250), z(2,201:250),'cyan')
xlabel('PC 1')
ylabel ('PC 2')
title('2D Scatter Plot')
legend('Fault_1 (bearing)','Fault_2 (gearmesh)','Fault_3 (misalignment)','Fault_4 (imbalance)','Fault_5 (resonance)','Location','best')