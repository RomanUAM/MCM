function [KM]=Matriz_know(P,Ns,OC,nLink,OCS,ISC,i)
A1=[];
A2=[];
j1=1;
for j=OC(i,1):(OC(i,1)+Ns(i,1)-1)
    A1(j1,:)=P(j,:);
    j1=j1+1;
end
j1=1;
for j=OCS(i,1):(OCS(i,1)+nLink(i,1)-1)
    A2(j1,:)=ISC(j,:);
    j1=j1+1;
end
KM=[A1;A2];