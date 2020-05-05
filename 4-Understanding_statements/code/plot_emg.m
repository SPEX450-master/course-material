function plot_emg(filename)
%PLOT_EMG Building on the EMG analysis from Week 2

% Load in the data from the specified text file
emgdata = csvread(filename);

% Convert the time column from frames to seconds
emgdata(:,1) = emgdata(:,1)/200;

% Baseline correct and Rectify the EMG data and convert the values from volts to millivolts
emgdata(:,2) = rectify(emgdata(:,2))*1000;

% Plot the graph of the signal with a title and axis labels
plot(emgdata(:,1), emgdata(:,2));

title(sprintf('The EMG amplitude of signal %d', 1)); 

xlabel('Time (s)');

ylabel('EMG amplitude (mV)');

% Save the current figure as a png file
saveas(gcf, sprintf('signal %d.png', 1),'png');