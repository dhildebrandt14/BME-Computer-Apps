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

Index1 = regexp(seqLong,codon1);
Index2 = regexp(seqLong,codon2);
Index3 = regexp(seqLong,codon3);

Index1Length = length(Index1);

fprintf('Index \n');    



fprintf('%s: Total Instances: %f \n     Offsets: %f %f %f %f %f \n             %f %f %f %f %f  \n',codon1,Index1Length,Index1(1),Index1(2),Index1(3),Index1(4),Index1(5),Index1(6),Index1(7),Index1(8),Index1(9),Index1(10))



