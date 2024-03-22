function y=field_pull_back(f,x)
% pull back of image x by vector field f
%f is a field
%x is an Image
x=double(x);
[M,N,pd]=size(x);
y=zeros(M,N,pd);
for i=1:pd
y(:,:,i)=warp(x(:,:,i),f(:,:,1),f(:,:,2));
end
