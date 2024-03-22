function p=grad(x) % compute gradient
    [X,Y,~]=size(x);
    grad1=[diff(x,1,1);zeros(1,Y)];
    grad2=[diff(x,1,2) zeros(X,1)];
    p=zeros(X,Y,2);
    p(:,:,1)=grad1;
    p(:,:,2)=grad2;
end