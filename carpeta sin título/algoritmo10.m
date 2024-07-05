function [solution]=algoritmo10(num_problem,n,Max_arragment,ifg,ffg,fcla,Nc_v,Nsi)
%______________________election to  problem to be solved __________________
% characteristic of this is problem
%clear all
%close all
%num_problem=1;
%n=30;
%Max_arragment=10000;
%ifg=0.01;
%ffg=0.04;
%fcla=0.1;
if num_problem==10;
    n=2;
end
%Nc_v=5;
%Nsi=5;
sol1=[];
a1=feval('limites',num_problem);
%lower limit
Ll=a1(1,1);
%upper limit
Ul=a1(1,2);
%____________________initial value of dynamic parameters __________________
for i=1:Nc_v
    Ns(i,1)=Nsi;
    om(i,1)=1;
    om(i,2)=1;
    vi(i,1)=0;
    vsom(i,1)=2;
end
%_________________Creating of initial solution for each composer___________
a1=0;   % auxiliar variable
for i=1:Nc_v
    OC(i,1)=a1+1;
    for j=1:Ns(i,1)
        a1=a1+1;
        for l=1:n
            P0(1,l)=Ll+(rand*(Ul-Ll));
        end
        P1=feval('evaluar',num_problem,P0(1,:),n);
        P(a1,:)=[P0 P1];
    end
end
Aux1=feval('Vector_that_offered_the_best_solution',P(:,:),n);
sol1(1,1)=Aux1(1,n+1);
v=0;
x_best=[];
x_best=feval('generating_set_xbest',P(:,:),Nc_v,Ns(:,1),OC(:,1),n,v,x_best);
assessments_counter=0;
Link=[];
tiempo_inicio=cputime;
%______________________Meeting the stop criterion__________________________
for v=1:Max_arragment
    S=[];
    vi=vi+1;
    Link=feval('update_link',Nc_v,Link(:,:),v,fcla);
    vector_factor=feval('factore',P(:,:),Nc_v,Ns(:,1),n,OC(:,1));
    %fg=ifg-((v/Max_arragent)*(ifg-ffg));
    %_________Determining for each composer his set of creativity  degree__
    x_worst=feval('generating_set_xworst1',P(:,:),Nc_v,Ns(:,1),OC(:,1),n);
    a5=0;
    for i=1:Nc_v
        a5a=a5;
        a6=0;
        for ii=1:Nc_v
            if Link(i,ii)==1
                if x_worst(i,1) > x_worst(ii,1)
                    j3=OC(ii,1)+round(rand*(Ns(ii,1)-1));
                    a5=a5+1;
                    a6=a6+1;
                    ISC(a5,:)=P(j3,:);
                end
            end
        end
        if i==1;
            if a5a==a5
                OCS(i,1)=a5;
                nLink(i,1)=0;
            else
                OCS(i,1)=1;
                nLink(i,1)=a6;
            end
        else
            if a5a==a5
                OCS(i,1)=OCS(i-1,1);
                nLink(i,1)=0;
            else
                if (OCS(i-1,1)+ nLink(i-1,1))==0
                    OCS(i,1)=1;
                    nLink(i,1)=a6;
                else
                    OCS(i,1)=OCS(i-1,1)+ nLink(i-1,1);
                    nLink(i,1)=a6;
                end
            end
        end
            
    end
    %_____________Generatin a New set of solutions_________________________
    P1=[];
    for i=1:Nc_v
        %Realiza una modificacion donde el cambio sea una unio de ambas
        %operaciones.
        KM=feval('Matriz_know',P(:,:),Ns(:,1),OC(:,1),nLink(:,1),OCS(:,1),ISC(:,:),i);
        [row column]=size(KM);
        fitness=feval('evaluating_fitness',KM(:,:),Nc_v,row,column);
        assessments_counter=assessments_counter+1;
        if rand <(1-ifg)
            a7=[];
            MH=feval('creating_matriz_rank_harmonic',KM(:,:),n);
            A3=feval('Taking_tune_of_KM_melody1',KM(:,:),n,fitness(:,1),row);
            if rand < (1-ffg)
                for l=1:n
                    j15=round(1+rand*(row-1));
                    A4(1,:)=KM(j15,:);
                    AA5=A4(1,l)+rand*((A3(2,l)+A3(1,l))-(2*A4(1,l)));
                    if AA5 < Ll
                        a7(1,l)=Ll+(rand*(A4(1,l)-Ll));
                    elseif AA5 > Ul
                        a7(1,l)=Ul-(rand*(Ul-A4(1,l)));
                    else
                        a7(1,l)=AA5;
                    end
                end
            else
                if rand < 0.5
                    a7(1,l)=Ll+(rand*(Ul-Ll));
                else
                    a7(1,l)=MH(1,l)-(rand*(MH(1,l)-MH(2,l)));
                end
            end
        else
            for l=1:n
                   a7(1,l)=Ll+(rand*(Ul-Ll));
            end
        end
        a8=feval('evaluar',num_problem,a7(1,:),n);
        New_proposal(1,:)=[a7 a8];
        % _____________Update artwork of the i-th composer_________________
        if x_worst(i,1) > New_proposal(1, n+1)
            P(x_worst(i,2),:)=New_proposal(1, :);
        end
        a21=1;
        for j=OC(i,1):(OC(i,1)+Ns(i,1)-1)
            A5(a21,:)=P(j,:);
            a21=a21+1;
        end       
        S(i,:)=feval('Vector_that_offered_the_best_solution',A5(:,:),n);
    end
    Aux1=feval('Vector_that_offered_the_best_solution',S(:,:),n);
    sol1(1,v+1)=Aux1(1,n+1);
end
tiempo_final= cputime;
tiempo=tiempo_final-tiempo_inicio;
%best_solution=feval('Vector_that_offered_the_best_solution',S(:,:),n);
solution=[sol1 tiempo assessments_counter];
%set_solution=S
