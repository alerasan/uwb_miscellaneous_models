function [Pulse] = CreatePulseForm(DesiredFs, PulseLen, PlotGraph)
N    = 8;      % Order
F3dB = 250e6;    % 3-dB Frequency
Fs   = DesiredFs;  % Sampling Frequency

h = fdesign.lowpass('n,f3db', N, F3dB, Fs);

Hd = design(h, 'butter', ...
    'SystemObject', true);

tst_impresp = impz(Hd, PulseLen);
% fvtool(Hd, tst_impresp);
tst_time = 0 : 1/Fs : 1/Fs * (length(tst_impresp) - 1);
if PlotGraph
    figure;
    % plot(tst_time, tst_impresp,'-o');
    grid on;
end
Pulse.Data = tst_impresp;
Pulse.TimeValues = tst_time;

Pulse = XoffsetPulse(Pulse);

% hold on; plot(Pulse.TimeValues, Pulse.Data,'-*');

Pulse = YresizePulse(Pulse);
if PlotGraph
    hold on; plot(Pulse.TimeValues, Pulse.Data,'-*');
    axis([-10 * 1e-9, 15 * 1e-9, -0.4, 1]);
end
end
function [outputPulse] = XoffsetPulse(inputPulse)
[max_value, max_pos] = max(inputPulse.Data);
outputPulse.Data = inputPulse.Data;
outputPulse.TimeValues = inputPulse.TimeValues - (max_pos - 1) * (inputPulse.TimeValues(2) - inputPulse.TimeValues(1));
end
function [outputPulse] = YresizePulse(inputPulse)
magicValueFromDWSheet = 0.9373;
outputPulse.Data = inputPulse.Data ./ (max(inputPulse.Data)) .* magicValueFromDWSheet;
outputPulse.TimeValues = inputPulse.TimeValues;
end
