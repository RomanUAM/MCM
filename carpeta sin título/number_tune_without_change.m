function [Nsci]=number_tune_without_change(KM,Nc_v,row,column)
mean_KM=mean(KM(:,column));
a1=0;
for j=1:row
    if KM(j,column)<=mean_KM
        a1=a1+1;
    else
        a1=a1+0;
    end
end
fMKM=a1/row;
Nsci=round(fMKM*Nc_v);
if Nsci>=Nc_v
    Nsci=Nc_v-1;
elseif Nsci<=0
    Nsci=1;    
end
