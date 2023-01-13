%
% Script to evaluate the effect of the spring force in the transfer
% function from the force applied to the huge mass to its acceleration.
%

m = 2.1605e+12;     % [kg]
J = 2.24428e+14;    % [kg * m^2]
ks = 8.5294e9;      % [N/m]

%
G = tf([1 0 0],[m 0 ks]);
G_ = tf([1 0 0],[m 0 0]);
G__ = tf([1/m 0 0],[1 2*0.02*sqrt(ks/m) ks/m]);

hbode = bodeoptions;
hbode.FreqUnits = 'Hz';
hbode.Grid = 'on';
om = 2*pi*logspace(log10(0.005),log10(100),1001);
figure(15);
bodemag(G,G_,G__,om,hbode);
legend('with spring force','with spring force','without spring force',...
    'Fontsize',12); legend boxoff;
set(gca,'Fontsize',11);