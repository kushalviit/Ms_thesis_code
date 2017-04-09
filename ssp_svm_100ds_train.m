clear
clc;
addpath('C:\Users\kushal\Documents\MATLAB\Thesis\libsvm-3.20\matlab');
%for original 100
load(fullfile('C:\Users\KUSHAL\Documents\MATLAB\ssp\finnoflaw.mat'));
load(fullfile('C:\Users\KUSHAL\Documents\MATLAB\ssp\finflaw.mat'));

p=randperm(50)';
flawsig=flaw(p,:);
noflasig=noflaw(p,:);
data1=flawsig(1:50,:);
data1=horzcat(ones(50,1),data1);
data2=horzcat(zeros(50,1),noflasig(1:50,:));
testdata1=flaw(51:100,:);
testdata2=noflaw(51:100,:);
traindata=vertcat(data1,data2);
p=randperm(100)';
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
optionCV.Nlimit = 20;
optionCV.svmCmd = '-q -t 2 -s 0';
Ncv_param = 8; % Ncv-fold cross validation cross validation
%automatic parameter selection
[bestc, bestg, bestcv] = automaticParameterSelection2(evalLabel, evalData, Ncv_param, optionCV);
cmd = [optionCV.svmCmd,' -b 1 -c ',num2str(bestc),' -g ',num2str(bestg)];
model = svmtrain(label, trdataf, cmd);
save('ssp_svm_100ds','model');
save('C:\Users\KUSHAL\Documents\MATLAB\ssp\svm_ssp_100ds_test.mat','testdata1','testdata2');
save('C:\Users\KUSHAL\Documents\MATLAB\ssp\svm_ssp_100ds_train.mat','data1','data2')
