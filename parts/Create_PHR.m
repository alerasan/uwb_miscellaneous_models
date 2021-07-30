function [PHR] = Create_PHR(Mode, DataRate, FrameLength, RNG, PreambleDuration)
EXT_BIT = 1;
switch Mode
    case 'OOK'
        warning('not implemented OOK Mode');
    case 'BPM-BPSK'
        if FrameLength <= 127
			switch DataRate
				case 0.11
					R1 = 0;
					R0 = 0;
				case 0.85
					R1 = 0;
					R0 = 1;
				case 6.81
					R1 = 1;
					R0 = 0;
				case 27.24
					R1 = 1;
					R0 = 1;
				otherwise
					error('choose a valid DataRate: 0.11, 0.85, 6.81, 27.24 Mbps');
			end
			
			if (FrameLength >= 0) && (FrameLength <= 127)
				val = de2bi(FrameLength);
				val = [val zeros(1, 7 - length(val))];
				L6 = val(1);
				L5 = val(2);
				L4 = val(3);
				L3 = val(4);
				L2 = val(5);
				L1 = val(6);
				L0 = val(7);
			else
				error('set a valid FrameLength: unsigned 7-bit integer value');
			end
			
			switch RNG
				case 0
					RNG_b = RNG;
				case 1
					RNG_b = RNG;
				otherwise
					error('set a valid RNG: 0 or 1');
			end
			
			switch PreambleDuration
				case {64, 128, 256, 512}
					P1 = 0;
					P0 = 1;
				case {1024, 1536, 2048}
					P1 = 1;
					P0 = 0;
				case {4096}
					P1 = 1;
					P0 = 1;
				otherwise
					error('set a valid Preamble Duration from a row: 64, 128, 256, 512, 1024, 1536, 2048, 4096');                
			end
			
			C0 = xor(R0, xor(R1, xor(L0, xor(L2, xor(L4, xor(L5, xor(EXT_BIT, P1)))))));
			C1 = xor(R1, xor(L2, xor(L3, xor(L5, xor(L6, xor(RNG, xor(EXT_BIT, P0)))))));
			C2 = xor(R0, xor(L0, xor(L1, xor(L5, xor(L6, xor(RNG, EXT_BIT))))));
			C3 = xor(L0, xor(L1, xor(L2, xor(L3, xor(L4, xor(RNG, EXT_BIT))))));
			C4 = xor(P0, P1);
			C5 = xor(R1, xor(R0, xor(L6, xor(L5, xor(L4, xor(L3, xor(L2, xor(L1, xor(L0, xor(RNG_b, xor(EXT_BIT, xor(P1, xor(P0, xor(C4, xor(C3, xor(C2, xor(C1, C0)))))))))))))))));
			
			PHR(1) = R1;
			PHR(2) = R0;
			PHR(3) = L6;
			PHR(4) = L5;
			PHR(5) = L4;
			PHR(6) = L3;
			PHR(7) = L2;
			PHR(8) = L1;
			PHR(9) = L0;
			PHR(10) = RNG_b;
			PHR(11) = EXT_BIT;
			PHR(12) = P1;
			PHR(13) = P0;
			PHR(14) = C5;
			PHR(15) = C4;
			PHR(16) = C3;
			PHR(17) = C2;
			PHR(18) = C1;
			PHR(19) = C0;
        else
            switch DataRate
				case 0.11
					R1 = 0;
					R0 = 0;
				case 0.85
					R1 = 0;
					R0 = 1;
				case 6.81
					R1 = 1;
					R0 = 0;
				case 27.24
					R1 = 1;
					R0 = 1;
				otherwise
					error('choose a valid DataRate: 0.11, 0.85, 6.81, 27.24 Mbps');
            end
            
            if (FrameLength >= 0) && (FrameLength <= 1023)
				val = de2bi(FrameLength);
				val = [val zeros(1, 10 - length(val))];
                L9 = val(1);
                L8 = val(2);
                L7 = val(3);
				L6 = val(4);
				L5 = val(5);
				L4 = val(6);
				L3 = val(7);
				L2 = val(8);
				L1 = val(9);
				L0 = val(10);
			else
				error('set a valid FrameLength: unsigned 10-bit integer value');
            end
            
            switch PreambleDuration
				case {64, 128, 256, 512, 1024}
					P0 = 0;
				case {1536, 2048, 4096}
					P0 = 1;
				otherwise
					error('set a valid Preamble Duration from a row: 64, 128, 256, 512, 1024, 1536, 2048, 4096');                
            end
            
            PHR(1) = R1;
			PHR(2) = R0;
			PHR(3) = L9;
			PHR(4) = L8;
			PHR(5) = L7;
			PHR(6) = L6;
			PHR(7) = L5;
			PHR(8) = L4;
			PHR(9) = L3;
			PHR(10) = L2;
			PHR(11) = L1;
			PHR(12) = L0;
			PHR(13) = P0;
			
            C0 = xor(PHR(2), xor(PHR(1), xor(PHR(9), xor(PHR(7), xor(PHR(5), xor(PHR(4), xor(PHR(11), PHR(12))))))));
            C1 = xor(PHR(1), xor(PHR(7), xor(PHR(6), xor(PHR(4), xor(PHR(3), xor(PHR(10), xor(PHR(11), PHR(13))))))));
            C2 = xor(PHR(2), xor(PHR(9), xor(PHR(8), xor(PHR(4), xor(PHR(3), xor(PHR(10), PHR(11)))))));
            C3 = xor(PHR(9), xor(PHR(8), xor(PHR(7), xor(PHR(6), xor(PHR(5), xor(PHR(10), PHR(11)))))));
            C4 = xor(PHR(13), PHR(12));
            C5 = xor(PHR(1), xor(PHR(2), xor(PHR(3), xor(PHR(4), xor(PHR(5), xor(PHR(6), xor(PHR(7), xor(PHR(8), xor(PHR(9), xor(PHR(10), xor(PHR(11), xor(PHR(12), xor(PHR(13), xor(C4, xor(C3, xor(C2, xor(C1, C0)))))))))))))))));
			
            S0 = not(C0);
            S1 = not(C1);
            S2 = not(C2);
            S3 = not(C3);
            S4 = not(C4);
            S5 = not(C5);
            
            PHR(14) = S5;
			PHR(15) = S4;
			PHR(16) = S3;
			PHR(17) = S2;
			PHR(18) = S1;
			PHR(19) = S0;
            
        end
    otherwise
        error('choose a valid mode: OOK or BPM-BPSK');
end
end

