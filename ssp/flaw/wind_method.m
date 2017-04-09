clear;
clc;
close all;
win=512;
for i=1:51
fname=strcat('ssp',int2str(i),'_wp.mat');
load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\flaw',fname));
figure;
plot(recon_ssp(1,:));
if  loc>400&&loc<600
    loc=loc-150;
elseif loc>=600
    loc=511;
elseif loc<400
    loc=1;
end
x=[recon_ssp(1,loc:loc+win-1),recon_ssp(2,loc:loc+win-1),recon_ssp(3,loc:loc+win-1),recon_ssp(4,loc:loc+win-1),recon_ssp(5,loc:loc+win-1),recon_ssp(6,loc:loc+win-1),recon_ssp(7,loc:loc+win-1),recon_ssp(8,loc:loc+win-1)];
     if i==1
      flaw(1,:)=x;
     else
    flaw=vertcat(flaw,x);  
     end
     clear loc;
     clear x;
     clear recon_ssp;
     clear width;
end
for i=103:122
fname=strcat('ssp',int2str(i),'_wp.mat');
load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\flaw',fname));
figure;
plot(recon_ssp(1,:));
if  loc>400&&loc<600
    loc=loc-150;
elseif loc>=600
    loc=511;
elseif loc<400
    loc=1;
end
x=[recon_ssp(1,loc:loc+win-1),recon_ssp(2,loc:loc+win-1),recon_ssp(3,loc:loc+win-1),recon_ssp(4,loc:loc+win-1),recon_ssp(5,loc:loc+win-1),recon_ssp(6,loc:loc+win-1),recon_ssp(7,loc:loc+win-1),recon_ssp(8,loc:loc+win-1)];
     
    flaw=vertcat(flaw,x);  
    
     clear loc;
     clear x;
     clear recon_ssp;
     clear width;
end
 save('C:\Users\kushal\Documents\MATLAB\ssp\flaw\flawwin256.mat','flaw');