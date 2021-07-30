clear all
close all
ModulationType = 'BPM-BPSK';
DataRateInMegaBitsPerSecond = 27.24;
FrameLengthInOctets = 25;
IsRangingPacket = 1;
PreambleDuration = 1536;

PHR = Create_PHR(ModulationType, DataRateInMegaBitsPerSecond, FrameLengthInOctets, IsRangingPacket, PreambleDuration);  