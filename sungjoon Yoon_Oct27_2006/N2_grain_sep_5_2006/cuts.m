clear;
clc;
load N2_grain_sep_5_2006.txt;
data=N2_grain_sep_5_2006(:,1:2048);

data1=data(3,1024:2048);
data2=data(4,1024:2048);
data3=data(5,1024:2048);
data4=data(6,1024:2048);
figure;
 subplot(4,1,1);
plot(data1(1,:));
 ylim([-100 100]);
    grid on;
    subplot(4,1,2);
plot(data2(1,:));
 ylim([-100 100]);
    grid on;
    subplot(4,1,3);
plot(data3(1,:));
 ylim([-100 100]);
    grid on;
    subplot(4,1,4);
plot(data4(1,:));
 ylim([-100 100]);
    grid on;
    sample4=data4(1,558:634);
   figure;
   plot(sample4);
   x=0.7;
   j=0;
   for i=1:20
   sample(i,:)=sample4.*x;
   figure
   plot(sample(i,:));
   x=x+0.07;
   end
 
save('C:\Users\kushal\Documents\MATLAB\sungjoon Yoon_Oct27_2006\N2_grain_sep_5_2006\cutsample4.mat','sample')

   