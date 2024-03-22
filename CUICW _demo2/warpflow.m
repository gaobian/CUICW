function result = warpflow (img, D)
% [m, n,~] = size (img);
% [x,y] = meshgrid (1:n, 1:m);
% Dx=D(:,:,1);
% Dy=D(:,:,2);
% x = x + Dx (1:m, 1:n); y = y + Dy (1:m,1:n);
% for i=1:m
%     for j=1:n
%         if x(i,j)>n
%             x(i,j) = n;
%         end
%         if x(i,j)<1
%             x(i,j) = 1;
%         end
%         if y(i,j)>m
%             y(i,j) = m;
%         end
%         if y(i,j)<1
%             y(i,j) = 1;
%         end
%     end
% end
% img=double(img);
[M,N,pd]=size(img);
result=zeros(M,N,pd);
for i=1:pd
    result(:,:,i)=warp(img(:,:,i),D(:,:,1),D(:,:,2));
end