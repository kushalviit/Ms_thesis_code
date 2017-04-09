clear;
clc;
loc=256;
window=256;
window_size=50;
window_offset=30;
window_width=0.5;
no_of_windows=8;

single_window=single_window';
N=256;
for i=1:14
fname=strcat('newscan',int2str(i),'.dat');
uecho = load(fullfile('C:\Users\kushal\Documents\MATLAB\ssp',fname));
uechowin=uecho(1,loc:(loc+window-1));
t_uechowin=(fft(uechowin));   
    t_uechowin(1)=0;
    figure;
    plot(abs(t_uechowin)/max(abs(t_uechowin)));
    title('Gaussian windows for SSP');
    hold;
     for j=1:1:no_of_windows
        ssp_windows(j,(j-1)*window_offset+2:(j-1)*window_offset+window_size+1)=single_window;
        ssp_windows(j,N+2-(j-1)*window_offset-window_size-1:N+2-(j-1)*window_offset-2)=single_window;
         plot(ssp_windows(i,:),'r');
     end
     hold off;
    for j=1:1:no_of_windows
    ssp_windows(j,:)=ssp_windows(j,:).*t_uechowin;
    end
    figure;
    hold;
     for j=1:1:no_of_windows
        reconstructed_ssp(j,:)=ifft(ssp_windows(j,:));
        mx=max(abs(reconstructed_ssp(j,:)));
        reconstructed_ssp(j,:)=reconstructed_ssp(j,:)/mx; %normalize them
        subplot(no_of_windows,1,j);
        plot(real(reconstructed_ssp(j,:)));
        recon_ssp(j,:)=real(reconstructed_ssp(j,:));
     end
     hold off;
end

 