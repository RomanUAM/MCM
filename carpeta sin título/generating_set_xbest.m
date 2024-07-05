function [x_best]=generating_set_xbest(P,Nc_v,Ns,OC,n,v,x_best_e)
for i=1:Nc_v
    A=[];
    a1=1;
    for j=OC(i,1):(OC(i,1)+Ns(i,1)-1)
        A(a1,:)=P(j,:);
        a1=a1+1;
    end
    a2(i,1)=min(A(:,n+1));
end
if v<2
    if v==0
        x_best(:,1)=a2(:,1);
        x_best(:,2)=a2(:,1);
    else
        x_best(:,1)=x_best_e(:,1);
        x_best(:,2)=a2(:,1);
    end
else
    x_best(:,1)=x_best_e(:,2);
    x_best(:,2)=a2(:,1);
end