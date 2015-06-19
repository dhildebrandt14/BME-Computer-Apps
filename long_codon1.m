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

codon1Offsets = regexp(seqLong,codon1);
codon2Offsets = regexp(seqLong,codon2);
codon3Offsets = regexp(seqLong,codon3);

offset1Length = length(codon1Offsets);
offset2Length = length(codon2Offsets);
offset3Length = length(codon3Offsets);  

filename='report_count.txt';
fid=fopen(filename, 'wt');

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