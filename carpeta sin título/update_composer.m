function [Nc]=update_composer(Nc_v1,vector_factor,n,Ns)
a1=-(2^(vector_factor(1,1)-1))*(log(vector_factor(1,2)))*((sqrt(vector_factor(1,4)*pi*(n-1)))/(vector_factor(1,3)));
a2=sum(Ns);
if (a2<a1)&&(a1~=inf)
    Nc=Nc_v1+1;
elseif (a2>a1)&&(Nc_v1>2)
     Nc=Nc_v1-1;
else
     Nc=Nc_v1;
end
