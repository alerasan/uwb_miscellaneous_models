close all
clear all
clc

addpath('../parts')

% 1. Create signal 
DesiredFs = 20e9;
PulseLen = 300;
[Pulse] = CreatePulseForm(DesiredFs, PulseLen, 0);
% 2. Create set of amplitudes, set of signals, choose (empirically) treshold
A = [1:0.05:30]';
Treshold = 20;
ListOfPulses = A.*Pulse.Data';
figure(1)
plot(Pulse.TimeValues, ListOfPulses)
%% 2. create reference signal
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
Xcorr = zeros(length(A), length(Pulse.Data) + length(ReferenceUWBPulse.Data));
for i = 1 : length(A)
    Xcorr(i,:) = abs(xcorr(ListOfPulses(i,:), ReferenceUWBPulse.Data));
end
[~, Xcorr_max_pos] = max(Xcorr);
XcorrTimeValues = 0 : 1 / DesiredFs : 1 / DesiredFs * (length(Xcorr) - 1);
XcorrTimeValues = XcorrTimeValues - (Xcorr_max_pos - 1) * (1 / DesiredFs);

% 4. find treshold-crossing point indices
[TresholdCrossTimes, TresholdCrossValues] = interpolateCrossingTimesAndValues(Xcorr, XcorrTimeValues, Treshold, length(A));

figure
hold on 
plot(XcorrTimeValues, Xcorr, '-o');
plot(TresholdCrossTimes, TresholdCrossValues, '.', 'MarkerSize', 15)
plot([-1 1], [Treshold Treshold])
xlim([-3e-8 2.5e-8])
grid on

% 5. translate time diffs to range, simply multiplying by speed of light
% we also have to choose some "reference point", which we suppose to have
% "zero" bias. we do it randomly, there is no rational explanation for this

speed_of_light = 299792458;
ZeroBiasPointIndex = 100;
TimeDeltas = TresholdCrossTimes - TresholdCrossTimes(ZeroBiasPointIndex);
RangeBiases = speed_of_light * TimeDeltas;
% translate amplitudes set to power sets
Adb = 20*log10(A);

figure;
plot(A, RangeBiases, '-o');
grid on
xlabel('A')
ylabel('R')

figure;
plot(Adb, RangeBiases, '-o')
grid on
grid minor
xlabel('A,db')
ylabel('R, m')



function [TresholdCrossTimes, TresholdCrossValues] = interpolateCrossingTimesAndValues(Xcorr, XcorrTimeValues, Treshold, SetLength)

for i = 1 : SetLength
    ValuesAboveThresholdIndexes = find(Xcorr(i, :) > Treshold);
    if isempty(ValuesAboveThresholdIndexes)
        warning('no points above treshold, consider change model settings');
    else
        TresholdCrossIndces(i) = ValuesAboveThresholdIndexes(1);
        xxx = [XcorrTimeValues(TresholdCrossIndces(i) - 1) XcorrTimeValues(TresholdCrossIndces(i))];
        yyy = [Xcorr(i, TresholdCrossIndces(i) - 1) Xcorr(i, TresholdCrossIndces(i))];
        TresholdCrossValues(i) = Treshold;
        TresholdCrossTimes(i) = interp1(yyy, xxx, Treshold, 'linear');
    end
end

end