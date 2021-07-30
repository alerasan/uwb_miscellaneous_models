clear all
close all

addpath('../parts')

figure;
hold on;
pulseform = flattopwin(32);
legends_string = [];
for k_bpsk_pos = 0 : 1
    for j_bpm_pos = 0 : 1
        for i_hop_pos = 0 : 7
            plot(Apply_BPSK_BPM_Hops(pulseform, 8, i_hop_pos, j_bpm_pos, k_bpsk_pos),'-o');
            legends_string = [legends_string;strcat('BPM: ',num2str(j_bpm_pos),'HOP: ', num2str(i_hop_pos))];
        end
    end
end
legend(legends_string(1,:), legends_string(2,:),legends_string(3,:), legends_string(4,:), legends_string(5,:), legends_string(6,:), legends_string(7,:), legends_string(8,:), legends_string(9,:), legends_string(10,:), legends_string(11,:), legends_string(12,:),legends_string(13,:), legends_string(14,:), legends_string(15,:), legends_string(16,:));