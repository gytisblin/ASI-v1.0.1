%Part 0
% Setting Values
disp('Running Setting Values Part');
root_dir = 'C:\Users\Alex\Desktop\Scintillation ASI Layer Detection';
data_dir = 'C:\Users\Alex\Desktop\Scintillation ASI Layer Detection\Data';
Years_Running = 2014:2018; % 2014:2019
addpath(genpath(root_dir));
CloudFileSingle = 'PKR_SMSP_STD_20140101.NC'; %file to construct cloudshape
CloudFileYearly = {'PKR_SMSP_STD_20140101.NC', 'PKR_SMSP_STD_20150111.NC', 'PKR_SMSP_STD_20160101.NC', 'PKR_SMSP_STD_20170101.NC', 'PKR_SMSP_STD_20180119.NC'};

CloudTimeSingleIndex = [1800 3000];
CloudTimeSingle = [42315 58595];

TimeCutoffSingle = [1000 4000];

TimeCutoffL = [1000 4000; 1000 4000; 1000 4000]; %don't need to be same length
CutoffAngle = 10; %cutoff angle for keogram, [deg] ABOVE horizon
SunDipCutoff = 12; %cutoff for sun dip angle, [deg] BELOW horizon (ie cutoff zenith = 90+SunDipCutoff)

ExcludeFile = 'PKR_SMSP_STD_20151110_old.NC';%file to exclude constructing DataF
ileNames

DirNames={'2014', '2015', '2016', '2017', '2018', '2019'};%.NC folder names

CloudShapeOption = 'yearly'; %yearly

% CloudMethod = 'greenandred'; %'onlygreen'
%Cloud Cut off COV
CVGreenCutoff = 0.38; %0.38 %values below designated cloudy; Old Value 0.25, new
 value found by comparing to NOAA cloud categorization
CVRedCutoff = 0.4;%values above designated noncloudy (overrides green)
RBRatio_Thresh = 0.5; %Threshold that determines the scintilation event layer as
 E or F Layer

% Dark sky limit, used to determine if aurora is present:
AvgIntGreenCutoff = 500; %500;%Values below this are designated dark sky, no aur
ora

ScintSpreadFileName = 'New_PFISR.xlsx';%filename of scintillation spreadsheet to
 read
% ScintSpreadFileName = 'Datta-Barua_scintillation_survey_2014-2019.xlsx'; %'dch_2014-2019_dataupdate.xlsx';%filename of scintillation spreadsheet to read



%Are these Needed???
% CloudTimeSingleIndex = [1800 3000];
% CloudTimeSingle = [42315 58595];
%
% TimeCutoffSingle = [1000 4000];
%
% TimeCutoffL = [1000 4000; 1000 4000; 1000 4000]; %don't need to be same length


disp('Finished Part 0');