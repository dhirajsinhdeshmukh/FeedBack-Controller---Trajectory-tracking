function dz = ode_dubins(t,z,param)
% use z for [x,y,theta]
dz =zeros(3,1);

%% TODO: Here is the code for control input.
%%% the controller needs to provide control input: linear velocity and
%%% steering angle: v, delta

% step 1: calculate the value of deviation variables given the
% desired state and input and the actual state, exacted from z.

% step 2: based on the feedback controller, calculate the e_u=
% [e_v, e_w].

% step 3: based on the relation between u and e_u, derive the
% desired input v, and w.

zd(1)=param{2}*t;
zd(2)=param{3};
zd(3)=0;

x=z(1);
y=z(2);
theta= z(3);

ex=[z-zd.'];


eu=-param{1}*ex;

v=(eu(1)+param{2});
w=(eu(2));

dz(1) = v*cos(theta);
dz(2) = v*sin(theta);
dz(3) = w;


end