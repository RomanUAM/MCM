function [nvdep]=number_varaibles_desicion_for_phrases(vector_factor,n)
Ls=n-vector_factor;
for m=1:vector_factor-1
    a2=Ls-1;
    if a2<0
        a2=0;
    end
    a1(m,1)=round(1+(rand*(a2)));
    Ls=Ls+1-a1(m,1);
end
a2=n-sum(a1(:,1));
nvdep(:,1)=[a1;a2];
for m=1:vector_factor
    if m==1
        nvdep(m,2)=1;
    else
        nvdep(m,2)=nvdep(m-1,2)+nvdep(m-1,1);
    end
end
