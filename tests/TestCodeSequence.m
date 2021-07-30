clc
close all
clear all

addpath('../parts')
%C - CodeSequence

% L- spreading factor or delta length
 
% SFD_ID_seq a
%            b
%            c
%            d
%            e
SFD_ID_seq = 'b';
SYNC_CodeIndex  = 1 ;
SYNC_IDSequence = 1 ;

SYNC = SYNC_CodeSequence( SYNC_CodeIndex, SYNC_IDSequence);
SFD = FuctionSFD(SFD_ID_seq);
SHR = CreatePreambleSHR(SYNC, SFD);