function [] = example6_NewtonAlgorithm3DDD (fig)
%solving f(x)=0 for x by Newton's algorithm
%from initial geuss x0

%initial approximation arbitrarily chosen
x0 = [77;12];

h = newton(x0);

h



%visualize(h, fig);

end

function [] = visualize(h, fig)

X1 = h(:,1);
X2 = h(:,2);
F1 = h(:,3);
F2 = h(:,4);

xmin = min(X1);
xmax = max(X1);
ymin = min(X2);
ymax = max(X2);


Dx = xmax - xmin;
Dy = ymax - ymin;

kx = 0.1;% extra space on the edges
ky = 0.1;

Nx = 10^3;
Ny = 10^3;

x = linspace(xmin - kx*Dx, xmax + kx*Dx, Nx);
y = linspace(ymin - ky*Dy, ymax + ky*Dy, Ny);

%[f, Df] = equationDefinition(x);

[x1c1, x2c1, R1, x1c2, x2c2, R2] = circleParameters ();
Xc1 = linspace(x1c1 - R1, x1c1 + R1, Nx);
Ysqrt1 = sqrt(R1^2 - (Xc1 - x1c1).^2);

Yc1U = x2c1 + Ysqrt1;
Yc1L = x2c1 - Ysqrt 1;

figure(fig);
clf;
hold on;

plot(X1, X2, 'b-');
plot(Xc1,Yc1U,'r-');

grid on;

xlabel('x1');
ylabel('x2');

end

function [history] = newton (x0)

[f0, Df0] = equationDefinition(x0);
x1 = x0 - Df0\f0; %Newton's step

[f1, Df1] = equationDefinition(x1);
history (1:2,:) = [x0',f0';x1',f1'];


Nmax = 10;%maximum allowed number of iterations

ErrLim = 10^(-15); %ending condition

%set the condition to run
n = 1;
err = computeError(x0, x1);

%loop
while(err > ErrLim && n <=Nmax)
    x0 = x1;
    f0 = f1;
    Df0 = Df1;
    x1 = x0 - Df0\f0;
    [f1, Df1] = equationDefinition(x1);
    
    err = computeError(x0, x1);
    n = n + 1;
    history (n + 1,:) = [x1',f1'];
end

end

function [e] = computeError(x0, x1)
%end by the change in x
e = sum((x1-x0).^2);

%end by the change in y
%[f0, Df0] = equationDefinition(x0);
%e = abs(f)

end

function [f, Df] = equationDefinition (x)
x1c1 = 71; x1c2 = 77;
x2c1 = 12; x2c2 = 15;
R1 = 5; R2 = 6;

f(1,1) = (x(1) - x1c1)^2 - (x(2) - x2c1)^2;
f(2,1) = (x(1) - x1c2)^2 - (x(2) - x2c2)^2;

Df(1, 1) = 2*(x(1) - x1c1);
Df(1, 2) = 2*(x(2) - x2c1);

Df(2, 1) = 2*(x(1) - x1c2);
Df(2, 2) = 2*(x(2) - x2c2);

end

function [x1c1, x2c1, R1, x1c2, x2c2, R2] = circleParameters ()
x1c1 = 71; x1c2 = 77;
x2c1 = 12; x2c2 = 15;
R1 = 5; R2 = 6;
end
