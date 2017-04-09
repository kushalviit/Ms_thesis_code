    clear;
    clc;
    N=2048;
    figure;
    for i=1:8
    fname=strcat('newscan',int2str(i),'.dat');
    fid = fopen(fname,'r');
    uecho=fread(fid,N,'double')';
    mx=min((uecho));
    norecho=uecho;
    %norecho=norecho./mx;
    norecho=norecho;
    norecho=norecho./std(norecho);
    subplot(8,1,i);
    plot(norecho);
    hold on;
    end
    hold off;