%% X-Factor processing script for many participants
% This script reads in .txt files created from the Golf Biodynamics system,
% calculates X-Factor and X-Factor Stretch and arranges them into a single
% .mat file for analysis.
%
% Created on 20 May 2020 by Peter Lamb
% Copyright (c) 2020, Peter Lamb
% last updated: 21 May 2020

%% Clear workspace and close open figures
clear; 

close all;

%% Set up directories, files and variables
% Identify text files in 'data' folder
txtFiles = dir(fullfile('data', 'raw', '*.txt'));

% Intermediate step identifying how many files were found
nFiles = length(txtFiles);

% Preallocate space for variables to build in the loop
XF = nan(nFiles,1); % X-Factor at start of downswing

XFS = nan(nFiles,1); % X-Factor stretch

COND = nan(nFiles,1); % Experimental condition; 
                      % 1 = easy swing, 2 = hard swing

%% Loop through each file in the data folder
for i = 1 : nFiles
   
    % Determine filename for "i-th" file in the data folder
    fileName = fullfile('data', 'raw', txtFiles(i).name);
    
    % Read in current file using csvread
    gD = csvread(fileName,9,0);
    
    %% Calculate dependent variables
    % Calculate the X-Factor throughout the swing
    xfVector = gD(:,17) - gD(:,14);
    
    % Determine the frame number of the start of the
    % downswing 
    [minVal,minIndex] = min(gD(:,14));
    
    % Extract the X-Factor value at start of downswing
    xf = xfVector(minIndex);
    
    % Calculate the maximum X-Factor (actually minimum
    % because angles are negative in the backswing).
    [xfMin,xfMinInd] = min(xfVector);
    
    % Calculate the difference between max X-Factor and X-Factor at start
    % of downswing
    xfs = xf - xfMin;
    
    % Assign current value to row i of XF
    XF(i) = xf;
    
    % Assign current value to row i of XFS
    XFS(i) = xfs;
    
    %% Extract meta-data from filename
    % Split filename by '_' character
    nameParts = strsplit(fileName, '_');
    
    % Extract the third cell
    condCell = nameParts{1,3};
    
    % Skip the 'C' character at the start and '.txt' at the end
    cond = condCell(2:end-4);
    
    % Convert the character to numeric
    cond = str2double(cond);
    
    % Assign the current condition to row i of the COND variable
    COND(i) = cond;
    
end

%% Save data to file 
save(fullfile('data', 'mat', '01_processed_xf_data.mat'),'XF','XFS','COND')