clear;
clc;

for i=1:7
fn=strcat('win250fil_',int2str(i),'.mat');
x=load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp',fn));
fn=strcat('win250nffil_',int2str(i),'.mat');
y=load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp',fn));
vx=[x.recon_ssp(1,:),x.recon_ssp(2,:),x.recon_ssp(3,:),x.recon_ssp(4,:),x.recon_ssp(5,:),x.recon_ssp(6,:),x.recon_ssp(7,:),x.recon_ssp(8,:)];
vy=[y.recon_ssp(1,:),y.recon_ssp(2,:),y.recon_ssp(3,:),y.recon_ssp(4,:),y.recon_ssp(5,:),y.recon_ssp(6,:),y.recon_ssp(7,:),y.recon_ssp(8,:)];
if i==1
flaw=vx;
noflaw=vy;
else
 flaw=vertcat(flaw,vx);
 noflaw=vertcat(noflaw,vy);
end
end
save('C:\Users\kushal\Documents\MATLAB\ssp\flawwin256.mat','flaw');
save('C:\Users\kushal\Documents\MATLAB\ssp\noflawwin256.mat','noflaw');
