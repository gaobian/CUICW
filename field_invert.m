function v=field_invert(u)
[m,n,d]=size(u);
v=zeros(m,n,d);
for niter=1:7
   v=inversion_interation(v,u);
end