% chambolle projection algorithm
% input image u0
% g MxN, p MxNx2 
function u=ChambolleProjection(g,tao,lambda,n)
% Chambolle Projection uses chambolle projection algorithm denoising .
% u0 input image
% n iteration time
[M,N,~]=size(g);
p=zeros(M,N,2); % initialize p0
for i=1:n
    X=div(p)-g/lambda;
    gradX=grad(X);
    numerator=p+tao*gradX;
    denominator=1+tao*sqrt(gradX(:,:,1).^2+gradX(:,:,2).^2);
    p=numerator./denominator; % MxNx2维的矩阵是可以和MxNx1的矩阵进行点乘和点除操作�?
    
end

u=g-lambda*div(p);

end

