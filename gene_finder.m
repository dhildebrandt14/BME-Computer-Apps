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


while i <= (sequenceLength - 2)
    subSeq = seqLong(i:i+2);
    
    if (strcmp(subSeq,'TAC'))
        geneStart = i;
        i = i + 3;
        endCodonFound = false;
        
        while (endCodonFound == false) && (i <= (sequenceLength - 2))
            subSeq = seqLong(i:i+2);

            if strmatch(subSeq, {'TAG', 'TAA', 'TGA'})
               startLocations = [startLocations geneStart];
               stopLocations = [stopLocations i];
               i = i + 3;
               endCodonFound = true;
               
            else
                i = i + 3;
            end

        end
    
    else
        i = i + 1;
    end
    
end
