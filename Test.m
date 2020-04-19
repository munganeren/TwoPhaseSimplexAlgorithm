%% Clear
clear all;
clc;

%% Input format
% For constraints, last row indicates type of the constraint
%  -1: <=, 0: =, 1: >=
% Second last row indicates the value in the RHS.
% Input sign shows basic variable signs. 
% 1: >0, 0: unrestricted in sign. 

%% Example 8.12 
% Page 344 [4th Edition]
% Example 1 in the homework

func        =  [-1 -4];
constraints =  [ 1  2  5 -1;
                 2  1  4  0;
                -1  1 -1 -1];
inputSign   =  [ 1  1];

%% Exercise 8.61
% Page 382 [4th Edition]
% Example 2 in the homework

% func        =  [10 18];
% constraints =  [ 1 -3 -3 -1;
%                  2  2  5  1];
% inputSign   =  [ 1  1];

%% Exercise 8.63
% Page 382 [4th Edition]
% Example 3 in the homework

% func        =  [ -2    -5  4.5 -1.5];
% constraints =  [   5    3  1.5    0  8 -1;
%                  1.8   -6    4    1  3  1;
%                 -3.6  8.2  7.5    5 15  0];
% inputSign   =  [ 1  1  1  1];

%% Example 8.16
% Page 353 [4th Edition]
% Example 4 in the homework - Unbounded Solution

% func        =  [-3   2];
% constraints =  [ 1  -1   0   1;
%                  1   1   2   1];
% inputSign   =  [ 1   1 ];


%% Homework Question
% Student ID: 518192012

% func        =  [ 5    -1    8 ];
% constraints =  [ 1  -13.5  -6    2   1;
%                  3     0    8    5   1;
%                  2    -2    7  -4.5  1;
%                  0    -1   25   1.5  1];
% inputSign   =  [ 1     1    0];

%% Extra Examples

% Exercise 8.57
% Page 382 [4th Edition]

% func        =  [-1 -4];
% constraints =  [ 1  2  5 -1;
%                  1  1  4  0;
%                  1 -1  3  1];
% inputSign   =  [ 1  1];

% Exercise 8.62
% Page 382 [4th Edition]

% func        =  [20 -6];
% constraints =  [ 3 -1  3  1;
%                 -4  3 -8  0];
% inputSign   =  [ 1  1];

%% Call Simplex Algorithm. 
SimplexAlgorithm(func, constraints, inputSign);