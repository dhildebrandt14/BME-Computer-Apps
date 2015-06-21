%
%
clear;
clc;

fileID = fopen('sequence_short.txt','r');
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

geneLength = stopLocations - startLocations;
aminoAcidNumber = (geneLength/3);

filename='report_short.txt';
fid=fopen(filename, 'wt');

fprintf(fid,'Names: Derek Hildebrandt, Jesus Gonzalez, Christianna Powell\n');
fprintf(fid,'Group: Group 3\n');
fprintf(fid,'Date: June 18, 2015\n');
fprintf(fid,'SectionB: DNA Pattern Matching - Short Sequence\n\n');
fprintf(fid,'Sequence Length: %0.0f \n\n',sequenceLength);

fprintf(fid,'Start Position:   %0.0f    End Position:    %0.0f \n',startLocations(1),stopLocations(1));
fprintf(fid,'Gene Length: %0.0f \n',geneLength);
fprintf(fid,'Amino Acid Total: %0.0f \n',aminoAcidNumber);

fprintf('Start Position:   %0.0f    End Position:    %0.0f \n',startLocations(1),stopLocations(1));
fprintf('Gene Length: %0.0f \n',geneLength);
fprintf('Amino Acid Total: %0.0f \n',aminoAcidNumber);