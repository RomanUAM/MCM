function [A3]=Taking_tune_of_KM_melody1 (KM,n,fitness,row)
election1=rand;
fitness_1=fitness(1,1);
j1=1;
while ((fitness_1 < election1)&& (j1<row))
     j1=j1+1;
     fitness_1=fitness_1+fitness(j1,1);
end
election2=rand;
fitness_1=fitness(1,1);
j2=1;
 while ((fitness_1 < election2)&& (j2<row))
    j2=j2+1;
    fitness_1=fitness_1+fitness(j2,1);
 end
A3(1,:)=KM(j1,:);
A3(2,:)=KM(j2,:);
