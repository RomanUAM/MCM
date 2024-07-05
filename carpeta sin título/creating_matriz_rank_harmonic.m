function [MRH]=creating_matriz_rank_harmonic(KM,n)    
for l=1:n
    MRH(1,l)=max(KM(:,l));
    MRH(2,l)=min(KM(:,l));
end