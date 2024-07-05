function [om]=update_vecto_om(vi,x_best,Nc_v1,om_a,vsom)
for i=1:Nc_v1
    if vi(i,1)>=2
        a1=x_best(i,1);
        a2=x_best(i,2);
        cm=(a1-a2);
        %a3=1+cm;
        %if a3 <=0
         %   a3=1/1000;
        %end
        %forget=v/max1;
        if cm > 0
            a4=1+rand;
        else
            a4=rand;
        end
        if vsom(i,1)==0;
            a5=om_a(i,1)*a4;
            if a5 <=0
                a5=1/1000;
            end
            om(i,1)=a5;
            om(i,2)=om_a(i,2);
        elseif vsom(i,1)==1
            a5=om_a(i,2)*a4;
            if a5 <=0
                a5=1/1000;
            end
            om(i,1)=om_a(i,1);
            om(i,2)=a5;
        else
           om(i,:)=om_a(i,:);
        end
    else
        om(i,:)=om_a(i,:);
    end
end