
%C -CodeSequence
% L- spreading factor or delta length
function [ SYNC]=CodeSequence(CodeIndex, IDSequence)

    switch CodeIndex
    case 1
        SYNC.C=[0 0 1 0 1 1 -1];
       
        switch IDSequence
            case 1
                L = 57;
                
            case 2
                L = 58;
               
            case 3
                L = 59;
               
            case 4
                L = 61;
               
            case 5
                L = 64;
             
            case 6
                L = 67;
                
            case 7
                L = 68;
               
            case 8
                L = 70;
                
            case 9
                L = 71;
                
            case 10
                L = 74;
                
        end
    case 2
        SYNC.C=[ 1 0 1 0 1 1 0 0 -1 -1 1 1 -1 ];
        
            switch IDSequence
            case 11
                L = 30;
               
            case 12
                L = 32;
               
            case 13
                L = 33;
               
            case 14
                L = 34;
                
            case 15
                L = 36;
                
            case 16
                L = 37;
               
            case 17
                L = 38;
                
            case 18
                L = 39;
                
            case 19
                L = 40;
               
            case 20
                L = 41;
               
            end
    case 3
        SYNC.C=[-1 -1 0 -1 1 0 0 -1 1 1 -1 0 1 0 1 -1 1 1 1 1 1];
       
            switch IDSequence
            case 21
                L = 20;
                
            case 22
                L =22;
              
            case 23
                L = 23;
                
            case 24
                L = 25;
              
            end
    case 4
        SYNC.C=[ 1 1 0 0 1 0 0 -1 -1 -1 1 -1 0 1 1 -1 0 0 0 1 0 1 0 -1 1 0 1 0 0 0 0 ];
        
         switch IDSequence
           
            case 25
                L = 13;
                
            case 26
                L = 14;
                
            case 27
                L = 15;
                
            case 28
                L = 16;
                
            case 29
                L =17;
                 
            case 30
                L = 18;
                 
        end
    case 5
        SYNC.C=[ 1 0 1 0 1 1 -1 1 1 -1 -1 1 -1 0 1 1 1 1 -1 -1 -1 1 1 1 1 1 -1 1 1 1 -1 0 -1 1 0 -1 -1 -1 1 -1 -1 -1 1 -1 1 0 1 1 -1 1 -1 -1 1 0 0 -1 1 ];
        
            switch IDSequence
            case 31
                L = 8;
              
            case 32
                L = 9;
                
            case 33  
                L = 10;
               
            end
    case 6
        SYNC.C=[ 0 0 0 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 -1 0 0 0 0 0 -1 0 1 0 0 0 0 1 0 0 0 0 0 0 -1 0 0 -1 1 0 0 0 0 0 -1 0 1 0 0 -1 1 0 1 1 1 0 0 0 0 ];
        
            switch IDSequence
            case 34
                L = 6;
                
            case 35
                L = 7;
             
            case 36 
                L = 8;
             
            case 37
                L = 9;
           
            end
    case 7
        SYNC.C=[ 0 0 1 0 1 1 1 0 1 1 -1 1 -1 1 -1 0 1 1 1 1 -1 -1 1 1 -1 -1 -1 1 -1 -1 -1 0 1 1 -1 1 0 1 1 1 1 -1 -1 -1 1 1 -1 1 -1 -1 -1 -1 1 -1 0 1 1 -1 1 -1 -1 -1 1 0 1 1 -1 1 1 -1 1 1 -1 ];
        
            switch IDSequence
            case 38
                L = 6;
               
            case 39
                L = 7;
               
            case 40 
                L = 8;
              
            end
        
    case 8
        SYNC.C=[ 1 0 1 0 -1 1 -1 1 -1 -1 -1 -1 0 1 -1 1 1 -1 1 1 -1 -1 -1 -1 -1 -1 0 1 -1 1 1 1 -1 1 1 1 -1 1 1 1 1 1 0 1 -1 1 -1 1 0 -1 1 -1 1 1 1 -1 -1 -1 1 1 1 1 1 -1 -1 1 -1 1 1 -1 1 1 -1 -1 0 0 -1 1 1 0 -1 -1 0 1 1 -1 -1 1 1 1 -1 ];
        
            switch IDSequence
            case 41
                L = 4;
             
            case 42
                L = 5;
                
            case 43 
                L = 6;
                
            end
    case 9
        SYNC.C=[ 1 0 0 1 0 0 0 -1 0 -1 -1 0 0 -1 -1 1 0 1 0 1 0 0 -1 1 -1 1 1 0 1 0 0 0 0 1 1 -1 0 0 0 1 0 0 -1 0 0 -1 -1 0 -1 1 0 1 0 -1 -1 0 -1 1 1 1 0 1 1 0 0 0 1 -1 0 1 0 0 -1 0 1 1 -1 0 1 1 1 0 0 -1 1 0 0 1 0 1 0 -1 0 1 1 -1 1 -1 -1 1 0 0 0 0 0 0 1 0 0 0 0 0 -1 1 0 0 0 0 -1 0 -1 0 0 0 -1 -1 1 ];
        
            switch IDSequence
            case 44
                L = 3;
                
            case 45
                L = 4;
                
            end
    case 10
        SYNC.C=[ 1 0 0 1 -1 -1 -1 1 1 1 1 1 1 1 1 -1 0 1 1 0 1 0 1 1 1 0 -1 1 -1 -1 -1 1 0 -1 -1 -1 1 1 -1 1 1 1 -1 1 1 -1 -1 -1 -1 1 -1 1 -1 0 -1 1 1 1 -1 1 -1 0 1 -1 1 -1 -1 -1 1 -1 1 -1 -1 -1 -1 1 -1 1 1 -1 1 -1 -1 1 1 1 0 1 -1 -1 -1 1 1 1 1 1 0 1 1 -1 -1 1 1 -1 -1 1 -1 -1 0 1 1 -1 -1 1 -1 1 -1 -1 -1 1 1 1 1 -1 1 1 -1 1 -1 -1 1 1 -1 ];

            switch IDSequence
            case 46
                L = 4;
            end
    case 11
        SYNC.C=[ -1 0 -1 -1 1 1 1 -1 1 1 1 -1 -1 1 -1 1 -1 -1 1 -1 1 1 1 1 1 0 -1 -1 1 1 -1 -1 1 1 -1 1 -1 -1 -1 0 1 0 1 1 1 0 1 -1 0 -1 -1 -1 -1 -1 1 -1 1 1 -1 -1 0 1 1 1 1 -1 1 -1 -1 -1 -1 1 1 1 -1 1 -1 1 -1 -1 1 1 -1 1 1 -1 1 0 -1 1 1 1 1 -1 1 -1 1 1 1 1 -1 1 1 -1 1 1 1 1 1 1 1 -1 1 -1 -1 1 1 -1 -1 -1 1 0 1 -1 -1 -1 -1 -1 1 1 -1 -1 1 1 1 1 1 1 1 -1 -1 1 1 0 1 -1 1 -1 1 -1 1 -1 -1 0 0 -1 -1 1 -1 1 -1 1 1 -1 -1 1 1 -1 -1 1 -1 0 -1 -1 -1 1 1 -1 -1 0 -1 1 1 ];
        
            switch IDSequence
            case 47
                L = 2;
                 
            case 48   
                L = 3;
                 
            end

    end
          
 Delta = zeros(1,L);
 SYNC.LengthSequence =length(C);
 Delta(1) = 1;
 SYNC.S = kron(C,Delta);
 SYNC.ChipsPerPreambleSymbol = length (S);
        
end
