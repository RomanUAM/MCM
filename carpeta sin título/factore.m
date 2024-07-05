function [vector_factor]=factore(P,Nc_v,Ns,n,OC)
%Randomly election of two compositers
i=round(1+(rand*(Nc_v-1)));
ii=round(1+(rand*(Nc_v-1)));
while (i==ii)
    ii=round(1+(rand*(Nc_v-1)));
end
j1=1;
for j=OC(i,1):(OC(i,1)+Ns(i,1)-1)
    A1(j1,:)=P(j,:);
    j1=j1+1;
end
j1=1;
for j=OC(ii,1):(OC(ii,1)+Ns(ii,1)-1)
    A2(j1,:)=P(j,:);
    j1=j1+1;
end
%Calculation of mean and variance of sets of solution of composers
%selectioned;
ai1=round(1+(rand*(Ns(i,1)-1)));
ai2=round(1+(rand*(Ns(ii,1)-1)));
va1(1,:)=A1(ai1,:);
va2(1,:)=A2(ai2,:);
hamming=0;
for l=1:n
    if (va1(1,l)==va2(1,l))
        hamming=hamming+0;        
    else
        hamming=hamming+1;
    end
end
frases=round(((2*hamming)/n)+n-hamming);
vector_factor=frases;