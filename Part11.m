%Part 11
%% Part 11
disp('Running part 11');
load('workce11.mat')
disp('Loaded!...');

% based on MagLOS ratios find ASI_BEF
for S=1:length(ScintData) %loop through each sheet(S)
    if ~isempty(ScintData{S})%only deal with nonempty types
        [ScintData{S}] = ResultCompareMagLOS(ScintData{S},NumScintEvents(S));
    end
end

% generate Stats table
% and compare ASC result with ISR in StatsISR
% [Stats,StatsISR,ScintData] = StatGen(ScintData,NumScintEvents,SheetName);
% also generate Histogram stats
[StatsB,StatsBISR,ScintData,HistGBR,HistRBratio] = StatGen2(ScintData,NumScintEvents,SheetName);

% filename = 'Stats.xlsx';
% delete (filename);
% writetable(Stats,filename,'Sheet','Stats')
% writetable(StatsISR,filename,'Sheet','StatsISR')

filename = 'FullScintResults.xlsx';%update master list
delete (filename);
for S=1:length(SheetName) %loop through each sheet(S)
    if ~isempty(ScintData{S})%only write nonempty sheets
        writetable(ScintData{S}(:,[1:25,33:35,59:61,65:68,79]),['E:\GNSS_Research\Code\alex_code\scintillation_asi_layer_detection\Code\OtherRequiredFuncs\' filename],'Sheet',SheetName{S})
    end
end
save('workspace12.mat','-v7.3','-nocompression')
disp('Finished Part 11');