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

x = 1;
geneTotal = length(startLocations);

fprintf('Total genes found: %d \n\n',geneTotal);

filename='report_long.txt';
fid=fopen(filename, 'wt');

fprintf(fid,'Names: Derek Hildebrandt, Jesus Gonzalez, Christianna Powell\n');
fprintf(fid,'Group: Group 3\n');
fprintf(fid,'Date: June 18, 2015\n');
fprintf(fid,'SectionB: DA Pattern Matching - Genes\n\n');

while x <= geneTotal
        fprintf(fid,'Gene %d: Start: %d End: %d \n\n',x,startLocations(x),stopLocations(x));
        x = x +1;
end

    
    
    
    
    
    
    
    
    