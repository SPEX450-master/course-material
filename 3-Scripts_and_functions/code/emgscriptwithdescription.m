% Set '3-Scripts_and_functions' to the current folder. Use the load command
% to load the prepared data file from the 'data' subfolder.
load('data/emg_data.mat')

% Copy the variable 'datacsv' to a new variable called 'emgdata'
emgdata = datacsv;

% Convert the contents of column 1 from frame numbers to time in seconds
emgdata(:,1) = emgdata(:,1)/200;

% Calculate the mean value for each of the 6 signals
emgmeans = mean(emgdata(:,2:7));

% Remove these mean values to centre the signals around zero volts
emgdata(:,2) = emgdata(:,2) - emgmeans(1);
emgdata(:,3) = emgdata(:,3) - emgmeans(2);
emgdata(:,4) = emgdata(:,4) - emgmeans(3);
emgdata(:,5) = emgdata(:,5) - emgmeans(4);
emgdata(:,6) = emgdata(:,6) - emgmeans(5);
emgdata(:,7) = emgdata(:,7) - emgmeans(6);

% Rectify the 6 EMG signals using the 'abs' function
emgdata(:,2:7) = abs(emgdata(:,2:7));

% Convert the EMG values from volts (V) to mV by multiplying by a factor of
% 1000
emgdata(:,2:7) = emgdata(:,2:7)*1000;

% Open a new figure
figure;

% Plot the EMG signal 1 (column 2 in emgdata) against time
plot(emgdata(:,1), emgdata(:,2));

% Add axis labels and a title
xlabel('Time (s)');
ylabel('EMG amplitude (mV)');
title('The EMG amplitude of signal 1');