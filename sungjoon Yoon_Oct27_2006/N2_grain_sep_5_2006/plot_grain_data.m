load N2_grain_sep_5_2006.txt;
data=N2_grain_sep_5_2006(:,1:2048); % grain part
[nAscan nSamples] = size(data);


nPage = round(nAscan/10);

nFullpage = mod(nAscan,10);

% for print_ind = 1: nFullpage

figure(1);
for index = 1 : 10
    subplot(10,1,index);
    plot(data(index,:));
    grid on;
    xlim([1 nSamples]);
    ylim([-100 100]);
end


figure(2);
for index = 11 : 19
    subplot(9,1,index-10);
    plot(data(index,:));
    grid on;
    xlim([1 nSamples]);
    ylim([-100 100]);
end
    