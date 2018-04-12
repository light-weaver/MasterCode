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

Training_Algorithms = {'deepRVEA'};
Optimization_Algorithms = {'cRVEA'};

Problems = {'ZDT1_100' 'ZDT1_1000' 'ZDT1_10000' ...
            'ZDT2_100' 'ZDT2_1000' 'ZDT2_10000' ...
            'ZDT3_100' 'ZDT3_1000' 'ZDT3_10000'};
in_index = [1:30];  %in_index = [a:b ; c:d; e:f] a:b for Problem 1, c:d for problem 2, and so on;
out_index = [31 32];

do_training = true; % if true, training will take place.
do_optimization = false; % if true, optimization will take place.
use_defaults = false; % if true, Default.mat will be used, otherwise Configuration.m will be used.
% multi_config = false;
param_name = {'alfhalf' 'alf1' 'alf2' 'alf3' 'alf4' 'alf5' ...
				'alf6' 'alf7' 'alf8' 'alf9' 'alf10' 'alf11' 'alf12' 'alf20' };
if use_defaults
    parameters = importdata('default.mat');
else
	for param = 1:length(param_name)
		parameters{param} = importdata([param_name{param} '.mat']);
		parameters{param}.in_index = in_index;
		parameters{param}.out_index = out_index;
	end
end


% parameters.in_index = in_index;
% parameters.out_index = out_index;

mkdir('Backup_data');
if do_training
for Prob = 1:length(Problems)
    for Algo = 1:length(Training_Algorithms)
		for param = 1:length(parameters)
			oldpath = path;
			addpath(genpath([pwd '\' Training_Algorithms{Algo}]));
			Train(Problems{Prob},parameters{param});
			%copyfile('Output/*','Backup_data')
			path(oldpath);
			pause(5);
			close all;
		end
    end
end
end
%param_name not added
if do_optimization
for Prob = 1:length(Problems)
    for Algo = 1:length(Training_Algorithms)
        for opt = 1:length(Optimization_Algorithms)
            oldpath = path;
            addpath(genpath([pwd '\' Training_Algorithms{Algo}]));
            addpath(genpath([pwd '\' Optimization_Algorithms{opt}]));
            savedir = fullfile(pwd,'Output',Problems{Prob},Training_Algorithms{Algo});
            addpath(savedir);
            Opt(Problems{Prob},Training_Algorithms{Algo},parameters,savedir);
            path(oldpath);
            pause(5);
            close all;
        end
    end
end
end   