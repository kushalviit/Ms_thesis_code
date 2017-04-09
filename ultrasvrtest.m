clear;
clc;
addpath('C:\Users\kushal\Documents\MATLAB\Thesis\libsvm-3.20\matlab');
load('C:\Users\kushal\Documents\MATLAB\ssp\svrtest.mat');
load('finultramodelsvr.mat');
for j=1:19
    
range=(j*2048-2047):j*2048;
x=tst_data.X(range,:);
y=tst_data.y(range,1);
[y_hat, Acc, projection] = svmpredict(y, x, model);
figure;
plot(y_hat);
figure;
for i=1:8
    subplot(8,1,i);
    plot(x(1:2048,i)');
end
end
