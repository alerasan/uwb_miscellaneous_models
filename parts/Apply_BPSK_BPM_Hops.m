function [out_signal] = Apply_BPSK_BPM_Hops(pulse, hop_slots, hop, bpm_value, bpsk_value)

out_signal = zeros(1, length(pulse) * hop_slots * 4);

GuardInterval = hop_slots * length(pulse);

start_index = 1 + hop * length(pulse) + bpm_value * (hop_slots * length(pulse) + GuardInterval);

stop_index = start_index + length(pulse) - 1;

out_signal(start_index : stop_index) = ( (-1) ^ bpsk_value) * pulse(1:end);

end