function [f]=evaluar(didu2,P,N_mot)
if (didu2==1)
    f=sum(P.^2);
elseif (didu2==2)
    f=sum(abs(P))+prod(abs(P));
elseif (didu2==3)
    a1=0;
    for l=1:N_mot-1
        a1(1,l)=(100*(P(1,l+1)-(P(1,l)^2))^2)+((1-P(1,l))^2);
    end
    f=sum(a1);
elseif (didu2==4)
    f=sum((floor(P+2)).^2);
elseif (didu2==5)
    a2=[];
    for l=1:N_mot
        a1=0;
        for ll=1:l
            a1=a1+P(1,l);
        end
        a2(1,l)=a1;
    end
    f=sum(a2.^2);
elseif (didu2==6)
    f=(418.9829*N_mot)-sum(P.*sin(sqrt(abs(P))));
elseif (didu2==7)
    a1=[];
    a1=(-10*cos(P.*pi()*2))+10;
    f=sum((P.^2)+a1);
elseif (didu2==8)
    a1=-20*exp(-0.2*sqrt((1/N_mot)*(sum(P.^2))));
    a2=-exp((1/N_mot)*(sum(cos(P.*2*pi()))));
    f=a1+a2+20+exp(1);
elseif (didu2==9)
    a1=[];
    for l=1:N_mot
        a1(1,l)=cos((P(1,l))/(sqrt(l)));
    end
    f=((1/4000)*sum(P.^2))-prod(a1)+1;
elseif (didu2==10)
    f=(4*P(1,1)^2)-(2.1*(P(1,1))^4)+((1/3)*(P(1,1))^6)+(P(1,1)*P(1,2))-(4*P(1,2)^2)+(4*P(1,2)^4);
elseif (didu2==11)
    %z=x-o in this case we have equaled the vector 'o' with a vector of ones 
    z=[];
    z=P-1;
    f=sum(z.^2)-450;
elseif (didu2==12)
    z=[];
    z=P-1;
    a2=[];
    for l=1:N_mot
        a1=0;
        for ll=1:l
            a1=a1+z(1,l);
        end
        a2(1,l)=a1;
    end
    f=sum(a2.^2)-450;
elseif (didu2==13)
    z=[];
    z=P-1;
    a1=0;
    for l=1:N_mot-1
        a1(1,l)=(100*(z(1,l+1)-(z(1,l)^2))^2)+((1-z(1,l))^2);
    end
    f=sum(a1)+390;
elseif (didu2==14)
    z=[];
    z=P-1;
    a1=[];
    a1=(-10*cos(z.*pi()*2))+10;
    f=sum((z.^2)+a1)-330;
elseif (didu2==15)
    z=[];
    M=50*eye(N_mot);
    z=(P-1)*M;
    a1=[];
    for l=1:N_mot
        a1(1,l)=cos((z(1,l))/(sqrt(l)));
    end
    f=((1/4000)*sum(z.^2))-prod(a1)+1-180;
else
    z=[];
    M=50*eye(N_mot);
    z=(P-1)*M;
    a1=[];
    a1=(-10*cos(z.*pi()*2))+10;
    f=sum((z.^2)+a1)-330;
end 