%
%
clear;
clc;

fileID = fopen('long_sequence.txt','r');
seqLong = fscanf(fileID,'%s');
fclose(fileID);

i = 1

codon1=input('Please input the first codon you wish to search for:' ,'s');
codon2=input('Please input the second codon you wish to search for: ','s');
codon3=input('Please input the third codon you wish to search for: ','s');

SequenceLength = length(seqLong);

while i <( SequenceLength - 3)
    