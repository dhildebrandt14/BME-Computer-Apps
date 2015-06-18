%
%
clear;
clc;

fileID = fopen('long_sequence.txt','r');
seqLong = fscanf(fileID,'%s');
fclose(fileID);

codon1=input('please input the first codon you wish to search for:','s');
codon2=input('please input the second codon you wish to search for:','s');
codon3=input('please input the third codon you wish to search for:','s');

i = 1;
SequenceLength = length(seqLong);

codon1Offsets = [];
codon2Offsets = [];
codon3Offsets = [];

while i <( SequenceLength - 3)
    
    subSeq = seqLong(i:i+2);
    
    if (strcmp(subSeq,codon1) == 1)
        codon1Offsets = [codon1Offsets i];
        i = i + 3;
    elseif (strcmp(subSeq,codon2) == 1)
        codon2Offsets = [codon2Offsets i];
        i = i + 3;
    elseif (strcmp(subSeq,codon3) == 1)
        codon3Offsets = [codon3Offsets i];
        i = i + 3;
    else i = i + 1;
        
    end
    
end


    