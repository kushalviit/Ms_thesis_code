clear;
clc;
for i=1:94
    a=strcat('sigflaw',int2str(i),'.mat');
    load(fullfile('C:\Users\kushal\Documents\MATLAB\sungjoon Yoon_Oct27_2006\N2_grain_sep_5_2006\modified',a));
    
    if i<=80
     if i==1
      coldat=temp;
     else
      coldat=vertcat(coldat,temp);
     end
    else
      coldat=vertcat(coldat,u);
    end
    
end
save('comdat.mat','coldat');