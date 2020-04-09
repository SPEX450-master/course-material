load('data/emg_data.mat')
emgdata = datacsv;
emgdata(:,1) = emgdata(:,1)/200;
emgmeans = mean(emgdata(:,2:7));
emgdata(:,2) = emgdata(:,2) - emgmeans(1);
emgdata(:,3) = emgdata(:,3) - emgmeans(2);
emgdata(:,4) = emgdata(:,4) - emgmeans(3);
emgdata(:,5) = emgdata(:,5) - emgmeans(4);
emgdata(:,6) = emgdata(:,6) - emgmeans(5);
emgdata(:,7) = emgdata(:,7) - emgmeans(6);
emgdata(:,2:7) = abs(emgdata(:,2:7));
emgdata(:,2:7) = emgdata(:,2:7)*1000;
figure;
plot(emgdata(:,1), emgdata(:,2));
xlabel('Time (s)');
ylabel('EMG amplitude (mV)');
title('The EMG amplitude of signal 1');