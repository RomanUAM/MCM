function [a1]=determining(A5,row1,column1)
a2=zeros(row1,row1);
for j=1:row1
    for jj=j+1:row1
        if A5(j,column1)==A5(jj,column1)
            a3=column1-1;
            for l=1:column1-1
                if A5(j,l)==A5(jj,l)
                    a3=a3-1;
                else
                    a3=a3-0;
                end                    
            end
            if a3==0
                a2(j,jj)=1;
            else
                a2(j,jj)=0;
            end
        else
            a2(j,jj)=0;
        end
    end
end
for j=1:row1
    a1(j,1)=sum(a2(j,:));
end
