%Part 12

%% Part 12
disp('Running part 12');
load('workspace12.mat')
disp('Loaded!...');
%
% fiddling with Histogram here
figure(1);
binw = 0.05;
edges=[-1000 0:binw:5 1000];
h1=histogram(HistRBratio,edges);
h1.Normalization = 'probability';
xlim([-.8 5.2])
xlabel(strcat('Red/Blue (630/428nm) Ratio, Bin Width = ',num2str(binw)))
ylabel('Bin Probability Of Categorized Images')
title('Histogram - Red/Blue Emission Ratios')

figure(2);
binw = 0.105/2;
edges=[-1000 0.01:binw:15 1000];
h2=histogram(HistGBR(:,2),edges);
h2.Normalization = 'probability';
xlim([-1 15.6])
xlabel(strcat('Blue 428nm Intensity [kRayleighs], Bin Width = ',num2str(binw)))
ylabel('Bin Probability Of Categorized Images')
title('Histogram - Blue Intensity (noisiest wavelength)')

figure(3)
pr = 0.105;%blue camera precision 'bit', [kRayleighs]
testb = [(2*0.21):0.21:(10*0.21)];
ratioskew = testb./(2.*(testb-(pr/2)));
plot(testb,ratioskew)
xlabel('Blue 428nm intensity [kRayliegh]')
ylabel({'Worst Case Measured Ratio' (strcat('Precision =',num2str(pr),'kR'))})
title('Effect of Blue Precision on Apparent Red/Blue Ratio')
% legend('1')

figure(4);
binw = 0.05;
edges=[-1000 0:binw:5 1000];
h1=histogram(HistRBratio,edges);
% histogram(X,'Normalization','cdf')
h1.Normalization = 'cdf';
xlim([-.8 5.2])
xlabel(strcat('Red/Blue (630/428nm) Ratio, Bin Width = ',num2str(binw)))
ylabel('Cumulative Probability')
title('CDF of Red/Blue Ratios')

figure(5);
binw = 0.105/2;
edges=[-1000 0.01:binw:15 1000];
h2=histogram(HistGBR(:,2),edges);
h2.Normalization = 'cdf';
xlim([-1 15.6])
xlabel(strcat('Blue 428nm Intensity [kRayleighs], Bin Width = ',num2str(binw)))
ylabel('Bin Probability Of Categorized Images')
title('CDF of Blue Intensity (noisiest wavelength)')

disp('Finished Part 12');
disp('DONE running!')
%close all;