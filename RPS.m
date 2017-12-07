clear;
s = 0.25; %Payoff in a tie to player 1

x0 = [.5 .01 .49];
y0 = [.5 .25 .25];
z0 = [x0 y0]';   % Initial conditions note col vec
A = [s -1 1; 1 s -1; -1 1 s]; %Payoff matrix for game: note player 2's is -A
z = z0;
game(0,z,A)
fac = sqrt(3)/4;
xProj = [1 -.5 -.5]'; %X-components of simplex vectors 
yProj = [0 sqrt(3)/2 -sqrt(3)/2]'; %y-components of simplex vectors
[T,Y] = ode45(@(t,z) game(t,z,A),[0 100],z,odeset('reltol',1e-5));
line([Y(:,1) Y(:,2) Y(:,3)] * xProj,[Y(:,1) Y(:,2) Y(:,3)] * yProj);
line([Y(:,4) Y(:,5) Y(:,6)] * xProj,[Y(:,4) Y(:,5)  Y(:,6)] * yProj, 'Color','R');
line([1,-1/2],[0, sqrt(3)/2]); %Draw bounds of simplex
line([1,-1/2],[0, -sqrt(3)/2]);
line([-1/2,-1/2],[-sqrt(3)/2, sqrt(3)/2]);
axis equal; title('Strategy evolution on simplex for symmetric RPS: x0 = \{.25,.40,.35\}, y0=\{.15,.4,.45\}');
