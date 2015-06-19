%
%
clear;
clc;

fileID = fopen('long_sequence.txt','r');
seqLong = fscanf(fileID,'%s');
fclose(fileID);

i = 1;
sequenceLength = length(seqLong);

startLocations = [];
stopLocations = [];

while i <( sequenceLength - 3)
    
    subSeq = seqLong(i:i+2);
    
    if (strcmp(subSeq,'TAC') == 1)
        startLocations = [startLocations i];
        i = i + 3;
        
            while i <( sequenceLength - 3)
                
                if (strcmp(subSeq,'TAG') == 1)
                stopLocations = [stopLocations i];
                i = i + 3;
         
                elseif (strcmp(subSeq,'TAA') == 1)
                stopLocations = [stopLocations i];
                 i = i + 3;
            
                elseif (strcmp(subSeq,'TGA') == 1)
                stopLocations = [stopLocations i];
                 i = i + 3;
        
                else
                    
                     i = i + 3;
            
                end
                
            end
    
    else i = i + 1;
        
    end
    
    
        
        
    
end
