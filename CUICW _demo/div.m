function divp=div(g) % compute divergence
    [M,N,~]=size(g);
    divp_1=[g(1,:,1);diff(g(:,:,1),1,1)];
    divp_1(M,:,1)=-g(M-1,:,1);

    divp_2=[g(:,1,2),diff(g(:,:,2),1,2)];
    divp_2(:,N,1)=-g(:,N-1,2);
    divp=divp_1+divp_2;
end