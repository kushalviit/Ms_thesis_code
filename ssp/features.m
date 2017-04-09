clear;
clc;
xpos=input('Which value will you choose as position of the flaw?');
%1933%1801%1685%1639%1639%1561%1521%1543%1601%1678%1767%1927%1943%2002
%472%530%206%1470%337%569%270%172%392%650%1500%210%470%130
for i=1:14
fn=strcat('ssp',int2str(i));
fname=strcat(fn,'.mat');
load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\newscan1\difsnr\dat14',fname));
ypos=input('Choose a position which doesnt indicate a flaw');
 %for j=1:8
  %   x(i,j)=real(recon_ssp(j,xpos));
   %  y(i,j)=real(recon_ssp(j,ypos));
 %end    
 for j=1:8
   di=[real(recon_ssp(j,xpos-30)), real(recon_ssp(j,xpos)),real(recon_ssp(j,xpos+25))];
   dix=diff(di)/30;
   dx(i,j)=dix(1,2);
   di=[real(recon_ssp(j,ypos-30)), real(recon_ssp(j,ypos)),real(recon_ssp(j,ypos+25))];
   diy=diff(di)/30;
   dy(i,j)=diy(1,2);
 end
end
feat=fullfile('C:\Users\kushal\Documents\MATLAB\ssp\newscan1\difsnr\dat14','dif1');
save(feat,'dx','dy');