function y=float_weisz(x)
[H,L]=size(x);
N1=H*L;
y=float_avg(x);
epsilon=1e-5;
dis=0;
den=0;
for i=1:5
for n=1:N1
    A=sqrt(epsilon+((y-x{n}).*(y-x{n})));
   dis = dis+(x{n}./A);
   den =den+(1./A);
end
y=dis./den;
end