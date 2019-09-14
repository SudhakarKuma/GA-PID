%{
This code is taken from the lectures of Dr. Steve Brunton. 
%}
clear all, close all, clc

dt = 0.001; % Time step 
PopSize = 40; 
MaxGenerations = 10;
s = tf('s');

% Define the system
%G = 1/(s*(s*s + 2*s + 1)); 
%G = 1/(s*(s+1)*(s+2)*(s+3)); 
%G = 1/((s+1)*(s+2)*(s+3)); 
G = tf(0.9, [0.00105 0.2104 0.8913 0]); 

options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGenerations',MaxGenerations,'OutputFcn',@myfun);
[x,fval] = ga(@(K)pidtune(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options);

