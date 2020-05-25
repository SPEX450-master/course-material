%% X-Factor analysis script for many participants
% This script loads '01_processed_xf_data.mat' created by the processing
% script, 'step01_process_xf_data.m' for analysis.
% Boxplots are created to compare X-Factor and X-Factor Stretch across two
% swing effort conditions (easy and hard) and performs statistical
% comparison.
%
% Created on 20 May 2020 by Peter Lamb
% Copyright (c) 2020, Peter Lamb
% last updated: 21 May 2020

% Clear workspace and close open figures
clear; 

close all;

%% Set up directories, files and variables
load(fullfile('data', 'mat', '01_processed_xf_data.mat'))

%% Create subplot of boxplots for each DV
% Set up figure window
figure('Units', 'centimeters',...
    'Position', [5 5 16 10],...
    'Color', 'w')

% Set up subplot (1 row x 2 columns)
subplot(1,2,1)

% Make plot with notch on, specified group labels and box widths
boxplot(XF,COND,...
    'Notch', 'on',...
    'Labels', {'Easy','Hard'},...
    'Widths', 0.6)

% Specify subplot title
title('X-Factor')

% Add y-axis label and units
ylabel('Angle (deg)')

% Repeat for DV2
subplot(1,2,2)

boxplot(XFS,COND,...
    'Notch', 'on',...
    'Labels', {'Easy','Hard'},...
    'Widths', 0.6)

title('X-Factor Stretch')

ylabel('Angle (deg)')

%% Statistical analysis of study data
% Check normality of data using qqplot
figure('Units', 'centimeters',...
    'Position', [5 5 16 10],...
    'Color', 'w')

qqplot(XF)

figure('Units', 'centimeters',...
    'Position', [5 5 16 10],...
    'Color', 'w')

qqplot(XFS)

% A couple outliers at the ends of the distribution, but looks fine for a
% small dataset.
% Since we have two comparisons, adjust alpha to 0.05/2
alpha = 0.05/2;

% Conduct paired-sample t-test on XF
[h_xf,p_xf,ci_xf,stats_xf] = ttest(XF(COND==1),XF(COND==2), 'Alpha', alpha);

% Conduct paired-sample t-test on XFS
[h_xfs,p_xfs,ci_xfs,stats_xfs] = ttest(XFS(COND==1),XFS(COND==2), 'Alpha', alpha);

%% Compute sample size needed for full powered study of X-Factor stretch and
% swing effort.

% Mean of sample 1
mu1 = mean(XFS(COND==1));

% Standard deviation of sample 1
sigma1 = std(XFS(COND==1));

% Mean of sample 2
mu2 = mean(XFS(COND==2));

% Sample size calculation, based on data distribution from pilot,
% paired-sample t-test and power of 0.9 (90% of rejecting the null when it
% should actually be rejected).
sampleSize = sampsizepwr('t', [mu1 sigma1], mu2 , 0.9);
