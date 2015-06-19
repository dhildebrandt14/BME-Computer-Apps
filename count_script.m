% Count_script.m - Derek, Jesus, Christianna  6/19/2015
% Description: Script loads a large sequence of nucleotides into a string
% and then prompts the user to input three codons that they want to search
% the string for. The script validates that the inputted codons are a
% combination of three A,C,G or T characters. The script then searches the
% sequence for the codons within the sequence, making sure not to include
% ones that coincide with each other. The total instances of each codon and
% the first 10 locations are then printed out.
%


clear;
clc;

fileID = fopen('long_sequence.txt','r');
seqLong = fscanf(fileID,'%s');
fclose(fileID);

codon1 = input('please input the first codon you wish to search for: ','s');
while isempty( regexp(codon1,'^[ATCG]{3}$') )
    codon1 = input('Invalid entry, please enter three valid nucleotides (A,G,C or T): ','s');
end
    
codon2 = input('please input the second codon you wish to search for: ','s');
while isempty( regexp(codon2,'^[ATCG]{3}$') )
    codon2 = input('Invalid entry, please enter three valid nucleotides (A,G,C or T): ','s');
end
codon3 = input('please input the third codon you wish to search for: ','s');
while isempty( regexp(codon3,'^[ATCG]{3}$') )
    codon3 = input('Invalid entry, please enter three valid nucleotides (A,G,C or T): ','s');
end

i = 1;
sequenceLength = length(seqLong);

codon1Offsets = [];
codon2Offsets = [];
codon3Offsets = [];

while i <=(sequenceLength - 3)
    
    subSeq = seqLong(i:i+2);
    
    if (strcmp(subSeq,codon1) == 1)
        codon1Offsets = [codon1Offsets i];
        i = i + 2;
        
    elseif (strcmp(subSeq,codon2) == 1)
        codon2Offsets = [codon2Offsets i];
        i = i + 2;
        
    elseif (strcmp(subSeq,codon3) == 1)
        codon3Offsets = [codon3Offsets i];
        i = i + 2;
        
    else
        i = i + 1;
        
    end
    
end

codon1Offsets = regexp(seqLong,codon1);
codon2Offsets = regexp(seqLong,codon2);
codon3Offsets = regexp(seqLong,codon3);

offset1Length = length(codon1Offsets);
offset2Length = length(codon2Offsets);
offset3Length = length(codon3Offsets);

fprintf('Index \n');    



fprintf('%s: Total Instances: %0.0f \n     Offsets: %0.0f %0.0f %0.0f %0.0f %0.0f \n                  %0.0f %0.0f %0.0f %0.0f %0.0f  \n',codon1,offset1Length,codon1Offsets(1),codon1Offsets(2),codon1Offsets(3),codon1Offsets(4),codon1Offsets(5),codon1Offsets(6),codon1Offsets(7),codon1Offsets(8),codon1Offsets(9),codon1Offsets(10))
fprintf('%s: Total Instances: %0.0f \n     Offsets: %0.0f %0.0f %0.0f %0.0f %0.0f \n                  %0.0f %0.0f %0.0f %0.0f %0.0f  \n',codon2,offset2Length,codon2Offsets(1),codon2Offsets(2),codon2Offsets(3),codon2Offsets(4),codon2Offsets(5),codon2Offsets(6),codon2Offsets(7),codon2Offsets(8),codon2Offsets(9),codon2Offsets(10))
fprintf('%s: Total Instances: %0.0f \n     Offsets: %0.0f %0.0f %0.0f %0.0f %0.0f \n                  %0.0f %0.0f %0.0f %0.0f %0.0f  \n',codon3,offset3Length,codon3Offsets(1),codon3Offsets(2),codon3Offsets(3),codon3Offsets(4),codon3Offsets(5),codon3Offsets(6),codon3Offsets(7),codon3Offsets(8),codon3Offsets(9),codon3Offsets(10))

filename='report_count.txt';
fid=fopen(filename, 'w');

fprintf(fid,'Names: Derek Hildebrandt, Jesus Gonzalez, Christianna Powell\n');
fprintf(fid,'Group: Group 3\n');
fprintf(fid,'Date: April 18, 2015\n');
fprintf(fid,'SectionA: Code Counting\n\n');

fprintf(fid,'For %s \n',codon1);
fprintf(fid,'Total Number: %0.0f \nFirst 10 Postitions: %0.0f %0.0f %0.0f %0.0f %0.0f \n                     %0.0f %0.0f %0.0f %0.0f %0.0f  \n\n', offset1Length,codon1Offsets(1),codon1Offsets(2),codon1Offsets(3),codon1Offsets(4),codon1Offsets(5),codon1Offsets(6),codon1Offsets(7),codon1Offsets(8),codon1Offsets(9),codon1Offsets(10));

fprintf(fid,'For %s \n',codon2);
fprintf(fid,'Total Number: %0.0f \nFirst 10 Postitions: %0.0f %0.0f %0.0f %0.0f %0.0f \n                     %0.0f %0.0f %0.0f %0.0f %0.0f  \n\n', offset2Length,codon2Offsets(1),codon2Offsets(2),codon2Offsets(3),codon2Offsets(4),codon2Offsets(5),codon2Offsets(6),codon2Offsets(7),codon2Offsets(8),codon2Offsets(9),codon2Offsets(10));

fprintf(fid,'For %s \n',codon3);
fprintf(fid,'Total Number: %0.0f \nFirst 10 Postitions: %0.0f %0.0f %0.0f %0.0f %0.0f \n                     %0.0f %0.0f %0.0f %0.0f %0.0f  \n\n', offset3Length,codon3Offsets(1),codon3Offsets(2),codon3Offsets(3),codon3Offsets(4),codon3Offsets(5),codon3Offsets(6),codon3Offsets(7),codon3Offsets(8),codon3Offsets(9),codon3Offsets(10));




fclose(fid);