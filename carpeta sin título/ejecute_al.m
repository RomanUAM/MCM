%____________________Heuristica 'Composición musical'______________________
%_____This is the program that we have used to comparison betwen the MMC
%heuristic and other algorithm. For this motive were used to 16 functions 
%of proof that were occupied for Q-P Pan et al 2010. ______________________
%___________________Made by Roman A. Mora Gutiérrez________________________ 
%____________________________in March 2011_________________________________
clear all
close all
resp=[];
for corrida=1:30
    num_problem=14;
    n=10;
    Max_arragment=7500;
    ifg=0.01;
    ffg=0.09;
    fcla=0.1;
    Nc_v=4;
    Nsi=10;
    %solution=feval('algoritmo',num_problem,n,Max_arragment,ifg,ffg,fcla,Nc_v,Nsi);  % Algoritmo politica 1 datos Q-Pan 2010 0.01 0.04 0.1 5 5 ->30,100
    %solution=feval('algoritmo10',num_problem,n,Max_arragment,ifg,ffg,fcla,Nc_v,Nsi); % Algoritmo politica 2 datos Q-Pan 2010  0.01 0.04 0.1 5 9->30,100
    %solution=feval('algoritmo1',num_problem,n,Max_arragment,ifg,ffg,fcla,Nc_v,Nsi); % Algoritmo politica 1 datos Liang 2006 0.01 0.1 0.1 4 10 -> 10
    solution=feval('algoritmo110',num_problem,n,Max_arragment,ifg,ffg,fcla,Nc_v,Nsi); % Algoritmo politica 2 datos Q-Pan 2010  0.01 0.09 0.1 4 10
    resp=[resp; solution];
end
