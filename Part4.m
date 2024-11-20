%Part 4
%% Part 4 Made a list of ASC that correspond to the scint events
disp('Running Part 4');
load('workspace3.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for S=1:length(ScintData) %loop through each sheet(S)
    if ~isempty(ScintData{S})%only deal with nonempty types
        [ScintData{S}] = ScintASCListGen(ScintData{S},NumScintEvents(S),ASCDays,ASCFileListSortedTime,ASCFileListSorted);
    end
end

for S = 1:length(ScintData)
    S
    if ~isempty(ScintData{S})
        [ScintData{S}] = PRNAnglebtw(ScintData{S}, NumScintEvents(S), data_dir);
    end
end

filename = 'FullScintResults.xlsx';
% if exist(filename,2)
%     delete (filename);
% end
% for S=1:length(SheetName) %loop through each sheet(S)
%     if ~isempty(ScintData{S})%only write nonempty sheets
%         writetable(ScintData{S}(:,[1:25,33:35]),[pwd '\' filename],'Sheet',SheetName{S})
%     end
% end

save('scint_data_part_4.mat','ScintData')

[ASCScintList, ASCScintListSorted, ASCScintDays] = ASCCombine(ScintData,NumScintEvents);
save('DownloadList.mat','ASCScintList','ASCScintDays','ASCScintListSorted')
disp('DONE generating list of ASC files per scint event')
save('workspace4.mat',...
    'ScintData', 'NumScintEvents', 'SheetName', 'root_dir', 'RBRatio_Thresh', ...
    '-v7.3','-nocompression')
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Adding code to move the download list to the download folder and check if we have all of the files downloaded, if not run the script to downlaod files
load('DownloadList.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
copyfile([pwd '\DownloadList.mat'], [pwd '\ASCDownloads\Download\DownloadList.mat']);
FileNames = [];
wd = cd; 
cd(root_dir);
cd(data_dir);
ASCScintList_temp = strings();
ASCScintListSorted_temp = cell(1,1228)
ASCScintDays_temp = strings();
Files = dir(fullfile('ASCDownloadFolder','*.FITS'));
% for i = 1:length(Files)
%     if sum(contains(ASCScintList, Files(i).name)) == 0
%         ASCScintList_temp(end+1) = Files(i).name
%         k = 1;
%         while test == 1
%             test = 0;
%             if sum(contains(ASCScintListSorted{k}, Files(i).name)) == 1
%                 if sum(contains(ASCScintDays_temp, ASCScintDays(k))) == 0
%                     ASCScintDays_temp(end+1) = ASCScintDays(k);
%                     ASCScintListSorted_temp{end+1} = {Files(i).name};
%                 else
%                     ind = find(strcmp(ASCScintDays_temp, Files(i).name));
%                     ASCScintListSorted_temp{k}(end+1) = Files(i).name;
%                 end
%             else
%                 test = 1;
%             end
%             k = k+1;
%         end
%     end
% end
% if ASCScintList ~= ASCScintList_temp
%     ASCScintList = ASCScintList_temp;
%     ASCScintListSorted = ASCScintListSorted_temp;
%     ASCScintDays = ASCScintDays_temp;
%     save('DownloadList2.mat','ASCScintList','ASCScintDays','ASCScintListSorted')
% end
% clear ASCScintList_temp ASCScintListSorted_temp ASCScintDays_temp

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
wd=cd
cd(wd)

if ~isempty(ASCScintList)
    DownloadASCModified;
end

disp('Finished Part 4');