close all;
clear;
clc;
for i=1:14
fn=strcat('ssp',int2str(i));
fname=strcat(fn,'.mat');
load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\newscan1\difsnr\dat4',fname));
figure;
 for j=1:1:8
     subplot(8,1,j);
     plot(real(recon_ssp(j,:))); 
     ylim([-1 1]);
 end    
end