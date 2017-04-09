clear;
clc;
close all;
load('C:\Users\kushal\Documents\MATLAB\ssp\dwtfea_lev2.mat');
for i=1:5
  if i==1
  seqp=sequences(i,:);
  sta=states(i,:);
  else
    seqp=horzcat(seqp,sequences(i,:));
    sta=horzcat(sta,states(i,:));
  end

end
seqp=seqp-mean(seqp);
seq=seqp/std(seqp);

coded_seq=seq>=mean(seq)&seq<=mean(seq)+std(seq);
coded_seq=coded_seq+2.*(seq>mean(seq)+std(seq)&seq<=mean(seq)+2*std(seq));
coded_seq=coded_seq+6.*(seq>mean(seq)+2*std(seq)&seq<=mean(seq)+3*std(seq));
coded_seq=coded_seq+8.*(seq>mean(seq)+3*std(seq));
coded_seq=coded_seq+(-1).*(seq>=mean(seq)-std(seq)&seq<mean(seq));
coded_seq=coded_seq+(-2).*(seq>=mean(seq)-2*std(seq)&seq<mean(seq)-std(seq));
coded_seq=coded_seq+(-6).*(seq>=mean(seq)-3*std(seq)&seq<mean(seq)-2*std(seq));
coded_seq=coded_seq+(-8).*(seq<mean(seq)-3*std(seq));
[TRANS,EMIS] = hmmestimate((abs(coded_seq)),sta);

