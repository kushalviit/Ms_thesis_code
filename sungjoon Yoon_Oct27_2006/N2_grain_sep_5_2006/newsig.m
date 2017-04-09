clear;
clc;
load N2_grain_sep_5_2006.txt;
data=N2_grain_sep_5_2006(:,1:2048);
data1(1,:)=data(1,1:1024);
data1(2,:)=data(1,1025:2048);
data1(3,:)=data(2,1:1024);
data1(4,:)=data(2,1025:2048);
data1(5,:)=data(3,1:1024);
data1(6,:)=data(4,1:1024);
data1(7,:)=data(5,1:1024);
data1(8,:)=data(6,1:1024);
data1(9,:)=data(7,1:1024);
data1(10,:)=data(7,1025:2048);
data1(11,:)=data(8,1:1024);
data1(12,:)=data(8,1025:2048);
data1(13,:)=data(9,1:1024);
data1(14,:)=data(9,1025:2048);
data1(15,:)=data(10,1:1024);
data1(16,:)=data(10,1025:2048);
data1(17,:)=data(11,1:1024);
data1(18,:)=data(11,1025:2048);
data1(19,:)=data(12,1:1024);
data1(20,:)=data(12,1025:2048);
data1(21,:)=data(13,1:1024);
data1(22,:)=data(13,1025:2048);
data1(23,:)=data(14,1:1024);
data1(24,:)=data(14,1025:2048);
data1(25,:)=data(15,1:1024);
data1(26,:)=data(15,1025:2048);
data1(27,:)=data(16,1:1024);
data1(28,:)=data(16,1025:2048);
data1(29,:)=data(17,1:1024);
data1(30,:)=data(17,1025:2048);
data1(31,:)=data(18,1:1024);
data1(32,:)=data(18,1025:2048);
data1(33,:)=data(19,1:1024);
data1(34,:)=data(19,1025:2048);
k=1;
for i=1:4
for j=1:20
z=input('Give the data number');
offset=input('Give the offset');
load(strcat('cutsample',int2str(i),'.mat'));
temp(1,:)=data1(z,:);
temp(1,offset:(offset+size(sample(j,:),2)-1))=sample(j,:);
newsample(k,:)=temp(1,:);
index(k,1)=offset;

 %figure;
%plot( newsample(i,:));
fn=strcat('sigflaw',int2str(k),'.mat');
save(fn,'temp','offset');
clear temp;
k=k+1;
%dummy=input('something');
%close all;
end    
end
