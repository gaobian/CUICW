function y = float_avg(x)
[H,L]=size(x);
N1=H*L;
[M,N,D]=size(x{1});
y=zeros(M,N,D);
for i=1:N1
    y=y+x{i};
end
y=y/N1;
