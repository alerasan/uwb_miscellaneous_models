# uwb_miscellaneous_models

this repo is intended to store miscellaneous UWB matlab models

## /parts
directory contains mix of UWB PHY-level parts. PHR, Preamble SHR, BPM-BPSK, Hops and some more
some of them test-covered, some not. 

## /tests
directory contains mix of UWB-PHY-level parts tests
working:
- TestCreate_PHR
- TestPulseForm
- TestApply_BPSK_BPM_Hops

seem to be broken:
- TestCodeSequence (missing part file)

## /PHY-level (802.15.4z-2020)

this one is not full, attention mostly paid to navigation-important parts, not informational. Pulse form, correlation with reference pulse and so on.
TODO - combine more parts in model


## /RangeBias Range bias dependency from received power

Decawave (Qorvo) documentation mentions some source of systematic error in UWB, which is dependent from receive power level
Decawave (Qorvo) suggests to use table-based compensation for this systematic error, but doesn't provide any information where this error comes from
This error is pretty crucial for precious RTLS systems (can reach up to 15-30 cm of systematic error). Hovewer, it can be easily accounted and compensated using different ways
Scope of this particular model is to research source of this error. 

We suggest that it comes from different times of signal arrival, cause of different treshold-crossing times.

Research steps:
1. Use PHY-level pulses (from first model)
2. Choose set of different amplitudes, create set of pulses 
3. Correlate pulses with reference pulse (also from first model) with set of pulses
4. Choose some treshold point, find time of treshold crossing for every pulse in set
5. Translate time delta's from time to range (simply multiplying by speed of light)
6. Plot dependency Bias(ReceivedPower)
7. Compare results with Decawave's (Qorvo's) pictures



Authors:
Semenov Valeriy, PhD student at Moscow Power Engineering Institute
Matveev Nikita, masters student at Moscow Power Engineering Institute
