clear;
clc;
addpath('C:\Users\kushal\Documents\MATLAB\Thesis\libsvm-3.20\matlab');
%for original 140
load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\finnoflaw1.mat'));
load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\finflaw1.mat'));
%for 140
p=randperm(70)';
flawsig=flaw(p,:);
noflasig=noflaw(p,:);
data1=flawsig(1:70,:);
data1=horzcat(ones(70,1),data1);
data2=horzcat(zeros(70,1),noflasig(1:70,:));
testdata1=flaw(71:140,:);
testdata2=noflaw(71:140,:);
traindata=vertcat(data1,data2);
p=randperm(140)';
traindata=traindata(p,:);
label=traindata(:,1);
trdataf=traindata(:,2:end);
evalData = trdataf(1:70,:);
evalLabel = label(1:70,:);
D=60;

optionCV.c = 1;
optionCV.gamma = 1/D;
optionCV.stepSize = 10;
optionCV.bestLog2c = 0;
optionCV.bestLog2g = log2(1/D);
optionCV.epsilon = 0.0001;
optionCV.Nlimit = 15;
optionCV.svmCmd = '-q -t 2 -s 0';
Ncv_param = 10; % Ncv-fold cross validation cross validation
%automatic parameter selection
[bestc, bestg, bestcv] = automaticParameterSelection2(evalLabel, evalData, Ncv_param, optionCV);
cmd = [optionCV.svmCmd,' -b 1 -c ',num2str(bestc),' -g ',num2str(bestg)];
model = svmtrain(label, trdataf, cmd);
save('SSP_SVM_140ds.mat','model');
save('C:\Users\kushal\Documents\MATLAB\ssp\ssp_svm_140ds_test.mat','testdata1','testdata2');
save('C:\Users\kushal\Documents\MATLAB\ssp\ssp_svm_140ds_train.mat','data1','data2')
