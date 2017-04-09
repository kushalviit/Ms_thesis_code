clear;
clc;
for i=103:140
  a=strcat('ssp',int2str(i),'.mat');
  load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\flaw',a));
   figure;
  for j=1:8
       subplot(8,1,j);
       plot(recon_ssp(j,:));
  end
  loc=input('enter the starting point of the flaw');
  ep=input('enter the end point of the flaw ');
  width=ep-loc;
  save(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\flaw',strcat('ssp',int2str(i),'_wp.mat')),'loc','width','recon_ssp');
 end
