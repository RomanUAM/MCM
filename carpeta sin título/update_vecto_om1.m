function [om]=update_vecto_om1(vi,x_best,Nc_v1,om_a,vsom)%v,Max_arragment)
a1=1;%rand*(v/Max_arragment);
for i=1:Nc_v1
    if vi(i,1)>=2
        if vsom(i,1)==0;
            if x_best(i,2) < x_best(i,1)
               om(i,1)=om_a(i,1)+a1;
               om(i,2)=om_a(i,2);
            else
               om(i,1)=om_a(i,1);
               om(i,2)=om_a(i,2);
            end
        elseif vsom(i,1)==1;
            if x_best(i,2) < x_best(i,1)
               om(i,1)=om_a(i,1);
               om(i,2)=om_a(i,2)+a1;
            else
               om(i,1)=om_a(i,1);
               om(i,2)=om_a(i,2);
            end
        else
            om(i,1)=om_a(i,1);
            om(i,2)=om_a(i,2);
        end
    else
        om(i,:)=om_a(i,:);
    end
end