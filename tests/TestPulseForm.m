close all
clear all

addpath('../parts');

span = 10;
sps = 30;
ReferenceUWBPulseData = rcosdesign(0.5, span, sps, 'sqrt');
ReferenceUWBPulseData = ReferenceUWBPulseData ./ max(ReferenceUWBPulseData);

ReferenceUWBPulse.Data = ReferenceUWBPulseData;
ReferenceUWBPulse.TimeValues = -10 * 1e-9 : 2 * 10 * 1e-9 /(span * sps + 1) : 10 * 1e-9 - 2 * 10 * 1e-9 /(span * sps + 1);

figure; plot( ReferenceUWBPulse.TimeValues , ReferenceUWBPulse.Data ,'-o');
grid on;


DesiredFs = 1/(diff(ReferenceUWBPulse.TimeValues(1:2)));

[Pulse] = CreatePulseForm(DesiredFs, span * sps + 1, 0);
figure;
grid on;
hold on; plot(Pulse.TimeValues*10^9 , Pulse.Data ,'LineWidth',1.5);
xlabel('Time, nanosec')

Xcorr = 1/sqrt(sum(Pulse.Data .^2 ) * sum(ReferenceUWBPulse.Data .^ 2) ) .* abs(xcorr(Pulse.Data, ReferenceUWBPulse.Data));
[~, Xcorr_max_pos] = max(Xcorr);
Xcorr_time_values = 0 : 1 / DesiredFs : 1 / DesiredFs * (length(Xcorr) - 1);
Xcorr_time_values = Xcorr_time_values - (Xcorr_max_pos - 1) * (1 / DesiredFs);
figure;plot(Xcorr_time_values, Xcorr,'-o');
grid on;
axis([-10 * 1e-9 10 * 1e-9 0 1]);