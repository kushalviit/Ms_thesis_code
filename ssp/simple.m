clear;
clc;
%for i=1:102
 % a=strcat('ssp',int2str(i),'.mat');
  %load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\flaw',a));
  
  %for j=1:8
   %   if j==1 
    % temp=recon_ssp(j,:);
     % else
     %temp=horzcat(temp,recon_ssp(j,:));
      %end
  %end
  %flaw(i,:)=temp;
  %clear temp;
  %end
for i=103:140
  a=strcat('ssp',int2str(i),'.mat');
  load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp\flaw',a));
  for j=1:8
      if j==1 
     temp=recon_ssp(j,1025:2048);
     temp1=recon_ssp(j,1:1024);
      else
     temp=horzcat(temp,recon_ssp(j,1025:2048));
     temp1=horzcat(temp1,recon_ssp(j,1:1024));
      end
  end
  flaw(i-102,:)=temp;
  noflaw(i-102,:)=temp1;
  clear temp;
end
save('C:\Users\kushal\Documents\MATLAB\ssp\finflaw2.mat','flaw','noflaw');