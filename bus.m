% M-code to calculate and plot the armature current
% supplied to an infinite bus as flux is varied from
% 80% to 100% of the flux at rated conditions.
% Define values for this generator
flux_ratio = 0.80:0.01:1.00; % Flux ratio
Ear = 2776; % Ea at full flux
dr = 27.3 * pi/180; % Torque ang at full flux
Vp = 1850; % Phase voltage
Xs = 15.7; % Xs (ohms)
% Calculate Ea for each flux
Ea = flux_ratio * Ear;
% Calculate delta for each flux
d = asin( Ear ./ Ea .* sin(dr));
% Calculate Ia for each flux
Ea = Ea .* ( cos(d) + j.*sin(d) );
Ia = ( Ea - Vp ) ./ (j*Xs);
% Plot the armature current versus flux
figure(1);
plot(flux_ratio*100,abs(Ia),'b-','LineWidth',2.0);
title ('\bfArmature current versus flux');
xlabel ('\bfFlux (% of full-load flux)');
ylabel ('\bf\itI_{A}\rm\bf (A)');
grid on;
hold off;