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
withinGene = false;

while i <= (sequenceLength - 2)
    subSeq = seqLong(i:i+2);
    if withinGene == false
       
        if (strcmp(subSeq,'TAC'))
            geneStart = i;
            i = i + 3;
            withinGene = true;
        else
            i = i + 1;
        end
        
    else
        
        if strmatch(subSeq, {'TAG', 'TAA', 'TGA'})
            startLocations = [startLocations geneStart];
            stopLocations = [stopLocations i];
            i = i + 3;
            withinGene = false;
        else
            i = i + 3;
        end


    end
    
end
