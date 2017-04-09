load Ref_grain_10by2.txt;
data=Ref_grain_10by2(:,1:2048); % grain part
[nAscan nSamples] = size(data);

figure;
for index = 1 : 10
    subplot(10,1,index);
    plot(data(index,:));
    noflaw(index,:)=data(index,1025:2048);
    if index==1
     title('File name: Ref-grain-10by2.txt(#0 Sample)     ASCAN#1----ASCAN#10'); 
    end
    grid on;
    xlim([1 nSamples]);
    ylim([-50 0]);
end


figure;
for index = 11 : 20
    subplot(10,1,index-10);
    plot(data(index,:));
    noflaw(index,:)=data(index,1:1024);
    if index == 11
     title('File name: Ref-grain-10by2.txt(#0 Sample)      ASCAN#11----ASCAN#20'); 
    end
    grid on;
    xlim([1 nSamples]);
    ylim([-50 0]);
end


 load ultrasonic_grain_data.mat;
 data=N2_grain_10by2(:,1:2048); % grain part
 [nAscan nSamples] = size(data);
 
 figure;
 for index = 1 : 10
     subplot(10,1,index);
     plot(data(index,:));
     noflaw(index+20,:)=data(index,1:1024);
     if (index==1)
        title('File name: N2-grain-10by2.txt     ASCAN#1----ASCAN#10'); 
     end
     grid on;
     xlim([1 nSamples]);
     ylim([-40 -10]);
 end
 
 
 figure;
 for index = 11 : 20
     subplot(10,1,index-10);
     plot(data(index,:));
     noflaw(index+20,:)=data(index,1025:2048);
     if index==11
      title('File name: N2-grain-10by2.txt     ASCAN#11----ASCAN#20'); 
     end
     grid on;
     xlim([1 nSamples]);
     ylim([-40 -10]);
 end
    



load N5_grain_10by2.txt;
data=N5_grain_10by2(:,1:2048); % grain part
[nAscan nSamples] = size(data);

figure;
for index = 1 : 10
    subplot(10,1,index);
    plot(data(index,:));
    noflaw(index+40,:)=data(index,1:1024);
    if index==1
     title('File name: N5-grain-10by2.txt     ASCAN#1----ASCAN#10'); 
    end
    grid on;
    xlim([1 nSamples]);
    ylim([-50 0]);
end


figure;
for index = 11 : 20
    subplot(10,1,index-10);
    plot(data(index,:));
    noflaw(index+40,:)=data(index,1:1024);
    if (index==11)
     title('File name: N5-grain-10by2.txt     ASCAN#11----ASCAN#20'); 
    end
    grid on;
    xlim([1 nSamples]);
    ylim([-50 0]);
end
for index = 1 : 20
 noflaw(index+60,:)=data(index,1025:2048);
end
save('noflaw.mat','noflaw');
