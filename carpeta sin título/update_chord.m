function [Ns]=update_chord(vi,x_best, Ns_v1,v,Nc_v,Max_arragment)
for i=1:Nc_v
    if (vi(i,1)>= 2)
        a1=x_best(i,1);
        if a1==0
            a1=1/10000;
        end
        a2=x_best(i,2);
        cm=(a1-a2)/a1;
        fc=1+(((Max_arragment-v)/Max_arragment)*cm);
        a3=round(Ns_v1(i,1)*fc);
        Ns(i,1)=max([3 a3]);        
    else
        Ns(i,1)=Ns_v1(i,1);
    end
end
