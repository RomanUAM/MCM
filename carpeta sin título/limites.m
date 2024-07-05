function [a1]=limites(didu2)
if (didu2==1) % Sphera function
    a1=[-100 100];
elseif (didu2==2) % Schwefel's problem 2.22 function 
    a1=[-10 10];
elseif (didu2==3) %Rosenbrock function
    a1=[-30 30];
elseif (didu2==4) %Step function
    a1=[-100 100];
elseif (didu2==5) %Rotate hyper-ellipsiod function 
    a1=[-100 100];
elseif (didu2==6) % Schwefel's problem 2.22 function
    a1=[-500 500];
elseif (didu2==7) %Rastring function
    a1=[-5.12 5.12];
elseif (didu2==8) %Acley's function
    a1=[-32 32];
elseif (didu2==9) %Grinwak function 
    a1=[-600 600];
elseif (didu2==10)%Six-hump Camel-back function
    a1=[-5 5];
elseif (didu2==11) %Shifed sphera function
    a1=[-100 100];
elseif (didu2==12) %Shifed  Schwefels function
    a1=[-100 100];
elseif (didu2==13) %Shifed Rosenbrock function
    a1=[-100 100];
elseif (didu2==14) %Shifed Rastring function
    a1=[-5 5];
elseif (didu2==15)%Shifed Rotate Grinwak function
    a1=[-100 100];
else %Shifed Rotate Rastring function
    a1=[-5 5];
end