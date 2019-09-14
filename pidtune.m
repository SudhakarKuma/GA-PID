%{
Implementing integral square error (ISE), integral absolute error (IAE), and integrated time absolute
error (ITAE)
%}
J = trapz(dt,(1-y(:)).^2) + trapz(dt, abs(1-y(:))) + trapz(dt, t.*abs(1-y(:)))