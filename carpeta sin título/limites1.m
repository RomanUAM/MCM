function [a1]=limites1(didu2)
if (didu2==1) % Sphera function
    a1=[-100 100];
elseif (didu2==2) % f2
    a1=[-2.048 2.048];
elseif (didu2==3) %f3
    a1=[-32.768 32.768];
elseif (didu2==4) %f4
    a1=[-600 600];
elseif (didu2==5) %f5
    a1=[-0.5 0.5];
elseif (didu2==6) %f6
    a1=[-5.12 5.12];
elseif (didu2==7) %f7
    a1=[-5.12 5.12];
elseif (didu2==8) %f8
    a1=[-500 500];
elseif (didu2==9) %f9
    a1=[-32.768 32.768];
elseif (didu2==10)%f10
    a1=[-600 600];
elseif (didu2==11) %f11
    a1=[-0.5 0.5];
elseif (didu2==12) %f12
    a1=[-5.12 5.12];
elseif (didu2==13) %f13
    a1=[-5.12 5.12];
else %f14
    a1=[-500 500];
end