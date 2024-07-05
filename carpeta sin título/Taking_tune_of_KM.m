function [A2]=Taking_tune_of_KM(fitness,KM,row,Nsci)
for j=1:Nsci
    election=rand;
    j1=1;
    fitness_i=fitness(1,1);
    while ((fitness_i < election)&& (j1<row))
         j1=j1+1;
         fitness_i=fitness_i+fitness(j1,1);
    end
    A2(j,:)=KM(j1,:);
end
