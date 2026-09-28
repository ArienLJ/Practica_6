clc
clear
close all

L = 2e-3;
R = 10;
C = 10e-6;
Uin = 32;

f = 100e3;             
D = 0.40;                 
T = 1 / f;

iL0 = 0;
Vc0 = 0;

x_inicial = [iL0; Vc0];

t_inicio = 0;
t_final = 5e-3;
tspan = [t_inicio, t_final];
options = odeset('RelTol', 1e-6, 'AbsTol', 1e-8, 'MaxStep', T / 20);

[t, x] = ode45(@(t, x) p6_(L, R, C, Uin, D, T, t, x), tspan, x_inicial, options);

subplot(2,1,1);
plot(x(:,1));
subplot(2,1,2);
plot(x(:,2));

function dxdt = p6_(L, R, C, Uin, D, T_sw, t, x)
d = double(mod(t, T_sw) < (D * T_sw));
dxdt = zeros(2,1);

dxdt(1) = 1/L * (-x(2) + Uin*(d));
dxdt(2) = 1/(R*C) * (R*x(1) - x(2));

end