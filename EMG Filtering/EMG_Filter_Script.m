%
%
%

clear;
clc;

filename = 'Force_EMG_Data.xls';
timeRange = 'A1:A35000';
forceRange = 'B1:B35000';
emgRange = 'C1:C35000';

timeData = xlsread(filename,timeRange);
forceData = xlsread(filename,forceRange);
emgData = xlsread(filename,emgRange);

rectifiedEMG = abs(emgData);
emgDataLength = length(rectifiedEMG);

filterNumber = input('Enter filter value: ');


filteredEMGData = [];
i = 1;
filterEnd = (i + filterNumber);
endCheck = (emgDataLength - i);

while i < emgDataLength
    if endCheck < filterNumber
        filterNumber = endCheck;
    end
    
    filteredPoint = sum(rectifiedEMG(i:filterEnd))/filterNumber;
    filteredEMGData = [filteredEMGData filteredPoint];
    i = i + filterNumber;
    
end
    




