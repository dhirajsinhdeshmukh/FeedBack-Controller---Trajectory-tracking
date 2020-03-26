clear all;
close all;

%% Steering control
T=60;
x0 =[0;10;0.7]; % Feel free to change the initial state and sampling horizon.
 
%%
% 
% <<C:\Users\deshm\OneDrive\Desktop\Robot control\homework\homework_export(2)\hw4\1.PNG>>
% 


%% Question 1 System Dynamics in terms of deviation terms
%%
% 
% <<C:\Users\deshm\OneDrive\Desktop\Robot control\homework\homework_export(2)\hw4\2.jpg>>
%
%%
% 
% <<C:\Users\deshm\OneDrive\Desktop\Robot control\homework\homework_export(2)\hw4\3.jpg>>
% 
%% Question 2 jacobian linerization
%%
% 
% <<C:\Users\deshm\OneDrive\Desktop\Robot control\homework\homework_export(2)\hw4\4.jpg>>
% 
%%
% 
% <<C:\Users\deshm\OneDrive\Desktop\Robot control\homework\homework_export(2)\hw4\5.jpg>>
% 
%% Question 3 Design Feedback controller
%%
% 
% <<C:\Users\deshm\OneDrive\Desktop\Robot control\homework\homework_export(2)\hw4\6.jpg>>
% 

a=[0 0 0;0 0 10;0 0 0];
b=[1 0;0 0;0 1];
p=[-0.5 -0.6 -0.1];
k=place(a,b,p);

fb_mat=a-b*k;

%% Question 4 Implement the controller 
%%
% 
% <<C:\Users\deshm\OneDrive\Desktop\Robot control\homework\homework_export(2)\hw4\7.jpg>>
% 

vr=10;
yr=2;

% design steering control to follow a straight lane while maintaining a given velocity
% the lateral position yr= ??;
param={k,vr,yr};


%TODO: param is the additional parameter to pass to the ode function.
[T,X] = ode45(@(t,x) ode_dubins(t,x, param), [0:T], x0, param);

% plot your state trajectories for both 1 and 2, using the following code or else.
figure(1)
plot(T,X(:,1),'LineWidth',1);
xlabel('t');
ylabel('x');
title('x VS Time');

figure(2)
plot(T,X(:,2),'LineWidth',1);
xlabel('t');
ylabel('y');
title('y VS Time');

figure(3)
plot(T,X(:,3),'LineWidth',1);
xlabel('t');
ylabel('theta');
title('theta VS Time');

figure(4)
plot(X(:,1), X(:,2))
xlabel('x');
ylabel('y');
title('y VS x');


car_animation(X(:,1),X(:,2),X(:,3));

