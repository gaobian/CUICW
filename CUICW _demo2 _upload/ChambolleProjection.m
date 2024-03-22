% chambolle projection algorithm
function u=ChambolleProjection(g,tao,lambda,n)
% Chambolle Projection uses chambolle projection algorithm denoising .
% u0 input image
% n iteration time
[M,N,~]=size(g);
p=zeros(M,N,2); 
for i=1:n
    X=div(p)-g/lambda;
    gradX=grad(X);
    numerator=p+tao*gradX;
    denominator=1+tao*sqrt(gradX(:,:,1).^2+gradX(:,:,2).^2);
    p=numerator./denominator; 
    
end

u=g-lambda*div(p);

end

