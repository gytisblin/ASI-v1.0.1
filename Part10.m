%Part 10
%% Part 10
disp('Running part 10');
load('workspace10.mat')
disp('Loaded!...');

% Check magnetic field LOS instead of satellite direction
missing_files = {};
for S=1:length(ScintData) %loop through each sheet(S)
    % S=4;
    S
    if ~isempty(ScintData{S})%only deal with nonempty event types
        [ScintData{S}] = MagLOS(ScintData{S},NumScintEvents(S),...
            ASCBias, bxpix, bypix);
    end
end

save('workce11.mat','-v7.3','-nocompression')
disp('Finished Part 10');