clear;
clc;
addpath('C:\Users\kushal\Documents\MATLAB\Thesis\libsvm-3.20\matlab');
load('C:\Users\kushal\Documents\MATLAB\ssp\flaw\trainsvr.mat');
load('C:\Users\kushal\Documents\MATLAB\ssp\flaw\testsvr.mat');
trn_data.X= flawtrain;
trn_data.y= idealytes;
tst_data.X=flawtest;
tst_data.y=idealytra;
%[trn_data, tst_data, jn2] = scaleSVM(trn_data, tst_data, trn_data, 0, 1);
[trn_data, tst_data, jn2] = scaleSVM(trn_data, tst_data, trn_data, 0, 1);
trn1_data.y=trn_data.y(1:19456,1);
trn_data1.X=trn_data.X(1:19456,:);

 param.s = 3; 					% epsilon SVR
 param.h=0;
param.C = max(trn_data.y) - min(trn_data.y);	% FIX C based on Equation 9.61
param.t = 2; 					% RBF kernel
param.gset = 2.^[-3:3];				% range of the gamma parameter
param.eset = [0:2];				% range of the epsilon parameter
param.nfold =3;				% 5-fold CV

Rval = zeros(length(param.gset), length(param.eset));

for i = 1:param.nfold
	% partition the training data into the learning/validation
	% in this example, the 5-fold data partitioning is done by the following strategy,
	% for partition 1: Use samples 1, 6, 11, ... as validation samples and
	%			the remaining as learning samples
	% for partition 2: Use samples 2, 7, 12, ... as validation samples and
	%			the remaining as learning samples
	%   :
	% for partition 5: Use samples 5, 10, 15, ... as validation samples and
	%			the remaining as learning samples

	data = [trn1_data.y, trn_data1.X];
	[learn, val] = k_FoldCV_SPLIT(data, param.nfold, i);
	lrndata.X = learn(:, 2:end);
	lrndata.y = learn(:, 1);
	valdata.X = val(:, 2:end);
	valdata.y = val(:, 1);

	for j = 1:length(param.gset)
		param.g = param.gset(j);

		for k = 1:length(param.eset)
			param.e = param.eset(k);
			param.libsvm = ['-s ', num2str(param.s), ' -t ', num2str(param.t), ...
					' -c ', num2str(param.C), ' -g ', num2str(param.g), ...
					' -p ', num2str(param.e),'-h',num2str(param.h)];

			% build model on Learning data
			model = svmtrain(lrndata.y, lrndata.X, param.libsvm);

			% predict on the validation data
			[y_hat, Acc, projection] = svmpredict(valdata.y, valdata.X, model);

			Rval(j,k) = Rval(j,k) + mean((y_hat-valdata.y).^2);
		end
	end

end

Rval = Rval ./ (param.nfold);
[v1, i1] = min(Rval);
[v2, i2] = min(v1);
optparam = param;
optparam.g = param.gset( i1(i2) );
optparam.e = param.eset(i2);
optparam.libsvm = ['-s ', num2str(optparam.s), ' -t ', num2str(optparam.t), ...
		' -c ', num2str(optparam.C), ' -g ', num2str(optparam.g), ...
		' -p ', num2str(optparam.e)];

    model = svmtrain(trn_data.y, trn_data.X, optparam.libsvm);
    save('finultramodelsvr.mat','model');

save('C:\Users\kushal\Documents\MATLAB\ssp\svrtest.mat','tst_data');