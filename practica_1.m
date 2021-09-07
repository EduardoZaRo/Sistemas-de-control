x = -2*pi:0.01:2*pi;
y = sin(x);
plot(x,y,'r--')
title('Seno')
xlabel('x')
ylabel('y')
grid

figure
y = cos(x);
plot(x,y,'p--')
title('Coseno')
xlabel('x')
ylabel('y')
grid

figure
y = tan(x);
plot(x,y,'g')
title('Tangente')
xlabel('x')
ylabel('y')
grid
