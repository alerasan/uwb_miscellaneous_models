function [SHR ]= CreatePreambolaSHR(SYNC,SFD)
SHR = cat(2,SYNC.S,SFD.Sequence);
end