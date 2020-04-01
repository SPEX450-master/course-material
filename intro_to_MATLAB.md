# An introduction to data analysis and MATLAB

## Data analysis
Data analysis, an unavoidable part of all experimentation and research, is often the postgrad student's greatest consumer of time and a major source of frustration. Consideration of analysis methods and the available tools is often left to the last minute when important decisions (or mistakes!) have already been made.

The aim of this section of the paper is to introduce and build skills and confidence in a number of useful data analysis tools. Such skills are highly sought after in a wide variety of postgraduate and employment opportunities.

### Raw data
Raw data are the original, unfiltered, unprocessed data that you record during the data collection. 
These data (note: *data* is plural and *datum* or *data point* is the singular form) are important and you should treat them so. Keep these original data files in a safe location and do not touch them. Make copies of these originals and then perform any analysis on the copies. This way, if you make any mistakes during your analysis you can always go back, make new copies of the originals and begin again. Raw data files should never be edited, this is not only poor practice but also unethical.

### Naming convention
Two students, A and B, both test four participants twice, once before an intervention session and once after. The data file names from the two are shown below:

| Student A  		| 					|
| ------------- 	| ----------- 	|
| Jonesy1.dat 	| Jonesy2.dat 	|
| Mike-T1.dat  	| Mike2.dat 		|
| Richard_1.dat	| Rich2.dat 		|
| Bill_1.dat 		| Bill_2.dat 		|

| Student B  		| 					|
| ------------- 	| ----------- 	|
| JM_T1.dat	 	| JM_T2.dat	 	|
| MF_T1.dat	  	| MF_T2.dat 		|
| RB_T1.dat		| RB_T2.dat 		|
| WN_T1.dat 		| WN_T2.dat 		|

To describe the naming convention for Student B you would say: use two letters, one for the first letter of the first name and one for the first of the surname, an underscore `_` and then the test number i.e. T1 for test 1 and T2 for test 2. Now look back and try to describe the convention for Student A.

Why is this important? File names are often a useful way of recording important information about what went on in the data collection session. You may include information like; participant name/id, experiment type/condition, trial number etc. For example, the name **PP1\_G3_T7.dat** could be used to indicate Participant 1, Group 3 and Trial 7. During the exercise in this module you will learn how to create automated data analysis processes to remove repetitive steps. You will learn how to write instructions for a computer to follow to process the data for you (you may be familiar with this already when using macros in Excel). In the case of Student B, you could instruct the computer to look at the first two characters to get the name of the subject and the fifth, or last, character to get the test number. You would have a difficult job instructing anyone how to extract information from the data file names used by Student A's convention!

###Take note
When you are collecting data it is useful and often critical to record all available information about the testing session. Record information such as sample rate, amplifier and filter settings, data channel names, equipment serial numbers, tester names, session date and time etc. All this information can be used to track down or exclude any errors/anomalies that may occur during data collection.

###Analysis software
After the data have been collected there will almost always be a number of processes that need to be completed before the results of the investigation can be presented. There could be multiple participants, trials, conditions and variables that may need to be cleaned, filtered and averaged before any statistical analysis can be used to determine an outcome. The data may also need to be collated from a number of separate locations and various different file formats.

These processes will undoubtedly be far too onerous to be done manually and you will need to find a software package to assist you. A familiar and easy to use program such as Microsoft Excel is often the first choice for most analysis procedures.  
This can be sufficient if the requirements are basic and the amount of data is minimal. However, it can be hugely time consuming and computationally inadequate for larger data sets and more complex analysis procedures.

There are other software programs available that are written specifically to facilitate powerful, repeatable and rapid data analysis. Unfortunately, as always, all of the benefits are not without some disadvantages. These software programs often require a period of learning before they can become useful. However, the goal of this module is to show that it is worth it!

##MATLAB – The Language of Technical Computing
The name MATLAB (note: should always written in *all caps*) stands for Matrix Laboratory and as the name suggests almost all the work done in MATLAB is based upon the manipulation of matrices. Therefore, it is important to get a basic understanding of what a matrix is, why they are so useful and how MATLAB uses them to tackle some applicable data analysis.

###Scalars, Vectors, Matrices, Arrays and Structures
In MATLAB a basic **matrix** is a rectangular array of numbers, arranged in rows and columns (rows x columns). The simplest matrix, a single number in a 1 x 1 (1 row by 1 column) arrangement, is known as a **scalar**. A single row or column of values is known as a **vector**.

A scalar (1 x 1):

`3`

A row vector (1 x 5):

<img src="../figs/row_vector.pdf?raw=true" alt="Row vector" width="150">

A column vector (5 x 1):

<img src="../figs/col_vector.pdf" alt="Column vector" width="50">

A matrix (4 x 3):

<img src="../figs/matrix_43.pdf" alt="Column vector" width="130">

You will be familiar with displaying data in rows and columns when using a spreadsheet, such as Microsoft Excel. Rows and columns are a very effective way of displaying data in readiness for further analysis. 
The table below shows the lap split times and maximum and minimum speeds for a 10-lap running race.

| Lap   	| Lap Time (s) | Maximum speed (m/s) | Minimum speed (m/s) |
| ----- | ----- | ----- | ----- |
1 | 67.4 | 7.2 | 2.4 |
2 | 68.2 | 6.3 | 5.5 |
3 | 70.1 | 6.1 | 5.3 |
4 | 70.4 | 5.9 | 5.1 |
5 | 69.3 | 6.3 | 5.7 |
6 | 71.2 | 5.8 | 5.0 |
7 | 73.8 | 5.7 | 4.9 |
8 | 75.2 | 5.5 | 4.5 |
9 | 73.4 | 5.6 | 5.2 |
10 | 71.1 | 8.7 | 4.8 |

The data could be stored in a matrix as shown below:

<img src="../figs/lap_matrix.pdf" alt=" " width="180">

This matrix, with rows and columns, is a two-dimensional (2D) matrix. It is possible to have multi-dimensional matrices and when we have more than three dimensions it can become very hard to visualise these arrangements. For a 3D matrix, in a 3 x 3 x 3 arrangement, the elements could be visualised as a simple rubix cube as shown here:

 <img src="../figs/3x3cube.png" alt="3D cube" width="220"> 
 
The three dimensions could be described as rows, columns and *blocks* of these rows and columns. The highlighted element would be in row 2, column 3 of block 2 (taken from the nearest top left corner).