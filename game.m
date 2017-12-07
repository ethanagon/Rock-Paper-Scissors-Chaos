function ds = game(t,z,A)
ds = zeros(6,1);
x = z(1:3,1); y = z(4:6,1);
dy = A*y;
dx = A*x;
e = x'*A*y;
for j = 1:3
    ds(j) = x(j) *  (dy(j) - e); 
end
e = y'*A*x;
for k =1:3
    ds(3 + k) = y(k) * (dx(k) - e);   % check sign of e
end
