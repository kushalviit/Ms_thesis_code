clear;
clc;
loc=1704;
width=78;
yideal=zeros(1,2048);
for j=1:width
     data(1,j)=j/width;
 end
 yideal(1,loc:(loc+width-1))=data(1,:);
for i=103:121
  a=strcat('ssp',int2str(i),'_wp.mat');
  load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\flaw',a));
 if i==103
flawtrain=recon_ssp';
idealytra=yideal';
 else
 flawtrain=vertcat(flawtrain,recon_ssp');
 idealytra=vertcat(idealytra,yideal');
 end
 
end
 for i=122:140
  a=strcat('ssp',int2str(i),'_wp.mat');
  load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\flaw',a));
 if i==122
flawtest=recon_ssp';
idealytes=yideal';
 else
 flawtest=vertcat(flawtest,recon_ssp');
 idealytes=vertcat(idealytes,yideal');
 end
 
 end
save('C:\Users\kushal\Documents\MATLAB\ssp\flaw\trainsvr.mat','flawtrain','idealytra');
save('C:\Users\kushal\Documents\MATLAB\ssp\flaw\testsvr.mat','flawtest','idealytes');
save('C:\Users\kushal\Documents\MATLAB\ssp\flaw\testindsvr.mat','yideal');