function result = warp (img, Dx, Dy)
[m, n,~] = size (img);
[x,y] = meshgrid (1:n, 1:m);
x = x + Dx (1:m, 1:n); y = y + Dy (1:m,1:n);
for i=1:m
    for j=1:n
        if x(i,j)>n
            x(i,j) = n;
        end
        if x(i,j)<1
            x(i,j) = 1;
        end
        if y(i,j)>m
            y(i,j) = m;
        end
        if y(i,j)<1
            y(i,j) = 1;
        end
    end
end
result = interp2 (img, x, y, 'cubic');