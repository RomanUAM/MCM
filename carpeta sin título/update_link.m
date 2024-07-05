function [Link]=update_link(Nc_v,Links,v,fcla)
if v==1
    Link=zeros(Nc_v,Nc_v);
    for i=1:Nc_v
        for ii=i+1:Nc_v
            if rand < 0.5
                Link(i,ii)=1;
                Link(ii,i)=1;
            else
                Link(i,ii)=0;
                Link(ii,i)=0;
            end
        end
    end
else
    Link(:,:)=Links(:,:);
    for i=1:Nc_v
        if rand < fcla
            ii=round(1+(rand*(Nc_v-1)));
            while i==ii
                ii=round(1+(rand*(Nc_v-1)));
            end
            if Link(i,ii)==0
                Link(i,ii)=1;
                Link(ii,i)=1;
            else
                Link(i,ii)=0;
                Link(ii,i)=0;
            end
        end
    end
end
a1=sum(Link);
for i=1:Nc_v
    if a1(1,i)==0
        ii=round(1+(rand*(Nc_v-1)));
        while i==ii
            ii=round(1+(rand*(Nc_v-1)));
        end
        Link(i,ii)=1;
        Link(ii,i)=1;
    end
end