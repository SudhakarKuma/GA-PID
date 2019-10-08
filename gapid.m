%{
This code is adapted from the lectures of Dr. Steve Brunton. 
The video lectures of Dr. Steve is available on https://www.youtube.com/watch?v=S5C_z1nVaSg
%}

clear all, close all, clc

dt = 0.001;
PopSize = 25;
MaxGenerations = 10;
s = tf('s');
G = 1/(s*(s*s+s+1));

% Transfer function of a third order system with poles at -1, -2 , -3
% G = 1/((s+1)*(s+2)*(s+3))

% Transfer function of the DC motor 
%G = tf(0.9, [0.00105 0.2104 0.8913 0]);


options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGenerations',MaxGenerations,'OutputFcn',@myfun);
[x,fval] = ga(@(K)pidtest(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options);
