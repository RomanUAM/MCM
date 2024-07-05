function [x_worst]=generating_set_xworst(P,Nc_v,Ns,OC,n)
for i=1:Nc_v
    A=[];
    a1=1;
    for j=OC(i,1):(OC(i,1)+Ns(i,1)-1)
        A(a1,:)=P(j,:);
        a1=a1+1;
    end
    [a2 a3]=max(A(:,n+1));
    x_worst(i,1)=a2;
    x_worst(i,2)=OC(i,1)+a3-1;
end