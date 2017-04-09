clear;
clc;
loc=612;
window=250;
addpath('C:\Users\kushal\Documents\MATLAB\ssp');
for i=1:14
fname=strcat('newscan',int2str(i),'.mat');
load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp',fname));
win250=u(1,loc:loc+window);
sfname=strcat('win250_',int2str(i),'.mat');
save(fullfile('C:\Users\kushal\Documents\MATLAB\ssp',sfname),'win250');
end