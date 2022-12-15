clear
px = [ 10, 20, 40, 50, 20 ];
py = [ 20, 40, 40, 20, 10 ];
plot(px, py, '*--'); axis equal; hold on;
syms t
cx(t) = 0*t;
cy(t) = 0*t;
n = 4;
for i= 0 : n
    b(t) = nchoosek( n, i ) * t^i * (1-t)^(n-i);
    cx(t) = cx(t) + px(i+1) * b(t);
    cy(t) = cy(t) + py(i+1) * b(t);
end
fplot(cx, cy, [0, 1])
% kezdőpontbeli érintővektor
a = [ n * (px(2)-px(1)), n * (py(2)-py(1)) ]
quiver(px(1), py(1), a(1), a(2))
% végpontbeli érintővektor
b = [ n * (px(5)-px(4)), n * (py(5)-py(4)) ]
quiver(px(5), py(5), b(1), b(2))

% csatolt Hermite ív
syms a3 a2 a1 a0

p2x = [20,20]
p2y = [10,-40]
t0=0;
t1=1;
ax = [-60,60]; ay=[-20,0]

f(t) = a3 * t^3 + a2 * t^2 + a1 * t + a0;
df = diff(f);
e = [f(t0)==p2x(1),f(t1)==p2x(2),df(t0)==ax(1),df(t1)==ax(2)];
m=solve(e, [a3,a2,a1,a0])

cx(t) = subs(f, [a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0])

syms b3 b2 b1 b0
h(t) = b3 * t^3 + b2 * t^2 + b1 * t + b0;
dh=diff(h);
e = [h(t0)==p2y(1),h(t1)==p2y(2),dh(t0)==ay(1),dh(t1)==ay(2)];
m=solve(e, [b3,b2,b1,b0])

cy(t) = subs(h, [b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0])
fplot(cx, cy, [0,1])

