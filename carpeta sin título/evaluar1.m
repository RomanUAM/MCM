function [f]=evaluar1(didu2,P,N_mot)
if (didu2==1)
    f=sum(P.^2);
elseif (didu2==2)
    a1=0;
    for l=1:N_mot-1
        a1(1,l)=(100*(P(1,l+1)-(P(1,l)^2))^2)+((1-P(1,l))^2);
    end
    f=sum(a1);
elseif (didu2==3)
    a1=-20*exp(-0.2*sqrt((1/N_mot)*(sum(P.^2))));
    a2=-exp((1/N_mot)*(sum(cos(P.*2*pi()))));
    f=a1+a2+20+exp(1);
elseif (didu2==4)
    a1=[];
    for l=1:N_mot
        a1(1,l)=cos((P(1,l))/(sqrt(l)));
    end
    f=((1/4000)*sum(P.^2))-prod(a1)+1;
elseif (didu2==5)
    a1=[];
    for l=1:N_mot
        a2=[];
        for i=1:20
           a2(1,i)=(0.5^i)*cos(2*pi*(3^i)*(P(1,l)+0.5));
        end
        a1(1,l)=sum(a2(1,:));
    end
    a2=[];
    a3=sum(a1(1,:));
    for i=1:20
         a2(1,i)=(0.5^i)*cos(2*pi*(3^i)*0.5);
    end
    f=a3-(N_mot*sum(a2(1,:)));
elseif (didu2==6)
    a1=[];
    a1=(-10*cos(P.*pi()*2))+10;
    f=sum((P.^2)+a1);
elseif (didu2==7)
    a1=[];
    for l=1:N_mot
        if abs(P(1,l))<(1/2)
            z(1,l)=P(1,l);
        else
            z(1,l)=(round(2*P(1,l)))/2;
        end
    end
    a1=(-10*cos(z.*pi()*2))+10;
    f=sum((z.^2)+a1);
elseif (didu2==8)
    f=(418.9829*N_mot)-sum(P.*sin(sqrt(abs(P))));
elseif (didu2==9)
    z=[];
    M=50*eye(N_mot);
    z=P*M;
    a1=-20*exp(-0.2*sqrt((1/N_mot)*(sum(z.^2))));
    a2=-exp((1/N_mot)*(sum(cos(z.*2*pi()))));
    f=a1+a2+20+exp(1);    
elseif (didu2==10)
    z=[];
    M=50*eye(N_mot);
    z=P*M;
    a1=[];
    for l=1:N_mot
        a1(1,l)=cos((z(1,l))/(sqrt(l)));
    end
    f=((1/4000)*sum(z.^2))-prod(a1)+1;    
elseif (didu2==11)
    z=[];
    M=50*eye(N_mot);
    z=P*M;
    a1=[];
    for l=1:N_mot
        a2=[];
        for i=1:20
           a2(1,i)=(0.5^i)*cos(2*pi*(3^i)*(z(1,l)+0.5));
        end
        a1(1,l)=sum(a2(1,:));
    end
    a2=[];
    a3=sum(a1(1,:));
    for i=1:20
         a2(1,i)=(0.5^i)*cos(2*pi*(3^i)*0.5);
    end
    f=a3-(N_mot*sum(a2(1,:)));
elseif (didu2==12)
    z=[];
    M=50*eye(N_mot);
    z=P*M;
    a1=[];
    a1=(-10*cos(z.*pi()*2))+10;
    f=sum((z.^2)+a1);
elseif (didu2==13)
    z=[];
    M=50*eye(N_mot);
    z=P*M;
    for l=1:N_mot
        if abs(z(1,l))<(1/2)
            y(1,l)=z(1,l);
        else
            y(1,l)=(round(2*z(1,l)))/2;
        end
    end
    a1=[];
    a1=(-10*cos(y.*pi()*2))+10;
    f=sum((y.^2)+a1);
else
    y=[];
    z1=0;
    M=2*eye(N_mot);
    z1=P*M;
    for l=1:N_mot
        if abs(z1(1,l))<=500
            y(1,l)=z1(1,l)*sin(sqrt(abs(z1(1,l))));
        else
            y(1,l)=0.001*(abs(z1(1,l))-500)^2;
        end
    end
    s = sum(y);
    f = 418.9829*N_mot-s;
end 