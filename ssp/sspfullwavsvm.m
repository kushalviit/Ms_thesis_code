clear;
clc;
close all;
addpath('C:\Users\kushal\Documents\MATLAB\Thesis\libsvm-3.20\matlab');
load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\newscan1\difsnr\dat8\ssp10.mat'));
load('C:\Users\kushal\Documents\MATLAB\ssp\newscan1\difsnr\svmodel.mat');
test=recon_ssp';
label=zeros(size(test,1),1);
label(1933,1)=1;
[predictedLabelx, accuracyx, decisValueWinnerx] = svmpredict(label,test, model, '-b 1');
figure;
plot(predictedLabelx);
