%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This file currently allows creation of meta-models from datasets
%% using BioGP and EvoNN, and the optimization of the meta-models
%% using EvoNN, BioGP, or RVEA.
%%
%% To be added : Multiple configuration support.
%%             : Creation of NN models using standard methods
%%             : Creation of NN and GP models using RVEA
%%             : Inclusion of other standard modeling methods
%%             : GUI
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% The parameters of various algorithms involved can be changed
%% from the Configuration.m file. Default values for those
%% parameters are saved in Default.mat
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Outputs are saved in the 'Output' folder. Temp folder stores
%% temporary outputs to be used by the program.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Autorun()
clc

Training_Algorithms = {'EvoNN'};
Optimization_Algorithms = {'cRVEA'};

Problems = {'zdt1data'};
in_index = [1:30];  %in_index = [a:b ; c:d; e:f] a:b for Problem 1, c:d for problem 2, and so on;
out_index = [31 32];

do_training = true; % if true, training will take place.
do_optimization = true; % if true, optimization will take place.
use_defaults = true; % if true, Default.mat will be used, otherwise Configuration.m will be used.
% multi_config = false;

if use_defaults
    parameters = importdata('Const.mat');
end

parameters.in_index = in_index;
parameters.out_index = out_index;

mkdir('Backup_data');
if do_training
for Prob = 1:length(Problems)
    for Algo = 1:length(Training_Algorithms)
        oldpath = path;
        addpath(genpath([pwd '\' Training_Algorithms{Algo}]));
        Train(Problems{Prob},parameters);
        copyfile('Output/*','Backup_data')
        path(oldpath);
        pause(5);
        close all;
    end
end
end

if do_optimization
for Prob = 1:length(Problems)
    for Algo = 1:length(Training_Algorithms)
        for opt = 1:length(Optimization_Algorithms)
            oldpath = path;
            addpath(genpath([pwd '\' Training_Algorithms{Algo}]));
            addpath(genpath([pwd '\' Optimization_Algorithms{opt}]));
            savedir = fullfile(pwd,'Output',Problems{Prob},Training_Algorithms{Algo});
            addpath(savedir);
            Opt(Problems{Prob},Training_Algorithms{Algo},parameters(param),savedir);
            path(oldpath);
            pause(5);
            close all;
        end
    end
end
end   