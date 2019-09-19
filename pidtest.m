function J = pidtest(G,dt,parms)

s = tf('s');
K = parms(1) + parms(2)/s + parms(3)*s/(1+.001*s);
Loop = series(K,G);
ClosedLoop = feedback(Loop,1);
t = 0:dt:30;
[y,t] = step(ClosedLoop,t);

CTRLtf = K/(1+K*G);
u = lsim(K,1-y,t);


% Cost function given by Dr. Steve Brunton
Q = 1;
R = .001;
J = dt*sum(Q*(1-y(:)).^2 + R*u(:).^2)


% Proposed cost function to minimize overshoot 
%J = dt*sum(Q*(max(y(:))-1).^2 + R*(1-y(:)).^2)


% Cost function based on ISE, IAE and ITAE
% w1 = 1; w2 = 1; w3 = 1; 
% ISE = w1*trapz(dt,(1-y(:)).^2) 
% IAE = w2*trapz(dt, abs(1-y(:))) 
% ITAE = w3*trapz(dt, t.*abs(1-y(:))) 
% J = ISE + IAE + ITAE

% Cost function based on minimum square error 
% for i = 1:30001
%     error(i) = 1 - y(i); 
% end    
% error_sq = error*error';
% J = error_sq/max(size(error));


step(ClosedLoop,t)
stepinfo(ClosedLoop)
h = findobj(gcf,'type','line');
set(h,'linewidth',2);
drawnow
