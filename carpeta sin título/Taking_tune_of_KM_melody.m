function [A3]=Taking_tune_of_KM_melody (fitness,KM,row)
election1=rand;
election2=rand;
while election1==election2 
    election2=rand;
end
j1=1;
fitness_1=fitness(1,1);
while ((fitness_1 < election1)&& (j1<row))
     j1=j1+1;
     fitness_1=fitness_1+fitness(j1,1);
end
j2=1;
fitness_2=fitness(1,1);
while ((fitness_2 < election2)&& (j2<row))
     j2=j2+1;
     fitness_2=fitness_2+fitness(j2,1);
end
A3(1,:)=KM(j1,:);
A3(2,:)=KM(j2,:);
