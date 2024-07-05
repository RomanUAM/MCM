function [fitness]=evaluating_fitness(KM,Nc_v,row,column)
a3=sum(KM(:,column));
for j=1:row
    fitness(j,1)=(a3-KM(j,column))/(a3*(Nc_v-1));
end
