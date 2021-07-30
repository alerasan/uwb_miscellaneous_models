close all
clear all
clc
%% 1. Create 802.15.4z-2020 example Pulse
% sampling frequency is compromise of "big enough to see pulse shape" and
% "long modeling time". Can be increased/decreased
DesiredFs = 20e9;
% Pulse is infinite by nature, but we have to limit it's length. 
% 300 samples length looks like good enough, pulse is about 15
% nanosec, main lobe is about 1 nanosec
PulseLen = 300;
[Pulse] = CreatePulseForm(DesiredFs, PulseLen, 0);

%% 2. Сreate reference signal
span = 10;
sps = 30;
ReferenceUWBPulseData = rcosdesign(0.5, span, sps, 'sqrt');
ReferenceUWBPulseData = ReferenceUWBPulseData ./ max(ReferenceUWBPulseData);

ReferenceUWBPulse.Data = ReferenceUWBPulseData;
ReferenceUWBPulse.TimeValues = -10 * 1e-9 : 2 * 10 * 1e-9 /(span * sps + 1) : 10 * 1e-9 - 2 * 10 * 1e-9 /(span * sps + 1);
figure(2); 
hold on
plot( ReferenceUWBPulse.TimeValues , ReferenceUWBPulse.Data ,'-o');
grid on;

%% 3. corr signal with reference signal
Xcorr=zeros(length(A),length(Pulse.Data)+length(ReferenceUWBPulse.Data));
for i=1:length(A)
Xcorr(i,:) =  abs(xcorr(Pulse.MassiveDiffPulse(i,:), ReferenceUWBPulse.Data));
end
[~, Xcorr_max_pos] = max(Xcorr);
Xcorr_time_values = 0 : 1 / DesiredFs : 1 / DesiredFs * (length(Xcorr) - 1);
Xcorr_time_values = Xcorr_time_values - (Xcorr_max_pos - 1) * (1 / DesiredFs);
Pulse.XcorrData = Xcorr;