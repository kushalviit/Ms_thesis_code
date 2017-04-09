 load('colflaw.mat');
 clear flaw;
 for j=1:54
     flaw(1,j)=1.5*j/54;
 end
 for i=1:20
    temp=zeros(1,1024);
     temp(1,index:index+53)=flaw;
     y(i,:)=temp;
     clear temp;
 end
 clear flaw;
 for j=1:67
     flaw(1,j)=1.5*j/67;
 end
 for i=1:20
    temp=zeros(1,1024);
     temp(1,index:index+66)=flaw;
     y(i+20,:)=temp;
     clear temp;
 end
 clear flaw;
  for j=1:56
     flaw(1,j)=1.5*j/56;
 end
 for i=1:20
    temp=zeros(1,1024);
     temp(1,index:index+55)=flaw;
     y(i+40,:)=temp;
     clear temp;
 end
 clear flaw;
 for j=1:77
     flaw(1,j)=1.5*j/77;
 end
 for i=1:20
    temp=zeros(1,1024);
     temp(1,index:index+76)=flaw;
     y(i+60,:)=temp;
     clear temp;
 end
 save('idealpred.mat','y');