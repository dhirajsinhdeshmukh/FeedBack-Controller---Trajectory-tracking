function car_animation(x,y,theta)

a=20;
for i=1:length(x)

rot=[cos(theta(i)) -sin(theta(i));sin(theta(i)) cos(theta(i))];
cardim=rot*[-a a a -a;-a/4 -a/4 a/4 a/4];

x1=cardim(1,:)+x(i);
y1=cardim(2,:)+y(i);

figure(5)
xlim([-50 600])
ylim([-80 80])
patch(x1,y1,'blue');
title('Car moving animation');
pause(0.1);



end
