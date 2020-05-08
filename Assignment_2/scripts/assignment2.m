%% SPEX 450 - Data processing and analysis module
%  ----------------------------------------------
%  Due 21 May, 2020

%% Assignment 2
%  ------------ 
%  This assignment focusses on reorganising data and calculating simple
%  descriptive statistics using MATLAB expressions and statements. NOTE:
%  variable names are case sensitive. Marks for each question are in
%  parentheses.

%  Run the following three lines in the Command Window to read in data from
%  the cosmed system.
    
[P633, headers] = xlsread('data/cosmed P633.xlsx', 'K1:X157');

[P634, headers634] = xlsread('data/cosmed P634.xlsx', 'K1:X153');

[P635] = xlsread('data/cosmed P635.xlsx', 'K1:X153');


%  1) The data columns for P634 have been entered differently than for the
%  other two participants. Look at and compare the variables 'headers' and
%  'headers634'. Reorder the columns in P634 to match those in the headers
%  variable.                                                            (1)



%  2) Concatenate the matrices P633, P634 and P635 vertically to make one
%  large matrix called D.                                               (2)



%  3) Create a column vector called ID with the same number of rows as D to
%  indicate participant number (e.g. 633, 634...). Enter the participant
%  numbers as numeric data, not as strings.                             (3)



%  4) Calculate the mean HR for each particpant and store the values in the
%  variable mean_hr. The first element should be the mean for P633 and so
%  on. Hint: try using logical indexing with the ID variable.           (2)



%  5) Notice that several HR measurements did not record properly,
%  resulting in measurements of 0, which is incorrect. Replace all 0s in
%  the HR column with NaN. Hint: a for loop with an if statement inside it
%  would work, or use logical indexing.                                 (4)



%  6) Calculate the new mean HR for each participant and store the values
%  in the variable nanmean_hr. Hint: look at the documentation for mean vs
%  nanmean. Notice the effect of misrecordings being assigned 0 and being
%  included in descriptive statistics.                                  (2)



%  7) Plot the HR data for each participant (633 in blue, 634 in red, 635
%  in black) with appropriate axis labels and save the figure as an image
%  file in the plots folder. Hint: 'hold on' prevents the plot command from
%  clearing previous plots. Use the saveas function to save your plot. For
%  full marks, the saveas command should save the plot into the appropriate
%  folder without you having to change the current folder. Each row
%  represents 10 s, bonus mark if you get the x-axis converted to time! (6)


