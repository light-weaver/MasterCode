function output = Configuration()
%Configuration - Return or create a configuration
%
% Syntax: output = Configuration()
%
% Long description
output.name = 'Const'; %configuration name
save_configuration = true; 
%%EvoNN Training Configs=============================
Evotrain.subsets = 1; Evotrain.overlap = 1;      %number of partitions of datafile and overlap b/w them
Evotrain.generations = 100;       % 10 max generations for evolution
Evotrain.nonodes = 8;           %maximum number of nodes
Evotrain.Prey_popsize = 800;      %500 Initial popsize
Evotrain.no_Prey_preferred = 700; %500 Desired popsize
Evotrain.no_new_Prey = 400;       %500 new prey introduced every KillInterval
Evotrain.Predator_popsize = 100;  %Number of Predators
Evotrain.no_x = 50;              %lattice size (no of rows)
Evotrain.no_y = 50;              %lattice size (no of cols)
Evotrain.ploton = 50;            %set 0 for no plots or 1 for plots at every generation
%======================================================
output.EvoTrain = Evotrain;

%%BioGP Training Config===============================
Biotrain.evo_type = 2; %set 1 for only Biobj evolution and 2 for first single obj followed by Biobj evolution
Biotrain.max_depth = 4;%max depth to which a tree grows
Biotrain.max_roots = 4;%max subtrees that a tree grows
Biotrain.subsets = 1;
Biotrain.overlap = 1;
Biotrain.generation1 = 20;           %generations for single obj evolution set Biotrain.evo_type = 2
Biotrain.generations = 100;          %max generations for evolution (initial 20)
Biotrain.maxrank = 30;               %maxrank retained at KillInterval
Biotrain.KillInterval = 5;          %Interval at which bad preys are eliminated
Biotrain.Prey_popsize = 300;         %Initial popsize
Biotrain.no_Prey_preferred = 800;    %Desired popsize
Biotrain.no_new_Prey = 600;          %new prey introduced every KillInterval
Biotrain.Predator_popsize = 100;     %Number of Predators
Biotrain.no_x = 50;                  %lattice size (no of rows)
Biotrain.no_y = 50;                  %lattice size (no of cols)
Biotrain.tour_size = 5;              %tournament size for single objective GP
Biotrain.ploton = 1;                 %set 0 for no plots or 1 for plots at every generation
Biotrain.lambda = 0.5;               %parameter to evaluate complexity of tree = lambda*depth + (1-lambda)*nodes
Biotrain.err_red_lim = 1e-3;         %any subtree contibuting less than this value for error reduction is eliminated
%====================================================
output.Biotrain = Biotrain;


%%EvoNN Optimization Configs=========================
EvoOpt.obj(1) = 1 ;  %set 1 for min and -1 for max
EvoOpt.obj(2) = 1 ;  %set 1 for min and -1 for max
EvoOpt.Prey_popsize = 500;         %Initial popsize
EvoOpt.no_Prey_preferred = 500;    %Desired popsize
EvoOpt.no_new_Prey = 200;          %new prey introduced every KillInterval
EvoOpt.Predator_popsize = 50;     %Number of Predators 100
EvoOpt.no_generations = 80;       %max generations
EvoOpt.P_move_prey = 0.5;          %Prob with which a Prey moves
EvoOpt.P_mut = 0.5;                %prob of choosing a prey for mutation
%Prob of Xover is 1 for every Prey
EvoOpt.F_bad = 1e5;                %fitness assigned to preys performing badly
%2D-lattice
EvoOpt.no_x = 50;                  %lattice size (no of rows) 50
EvoOpt.no_y = 50;                  %lattice size (no of cols) 50
EvoOpt.KillInterval = 4;          %Interval at which bad preys are eliminated
EvoOpt.maxrank = 20;               %maxrank retained at KillInterval
EvoOpt.ploton = 1;                 %set 0 for no plots or 1 for plots at every generation
%constraints
EvoOpt.useConstraints = true; 
EvoOpt.LB_F = [0 0];              %set upper bound for F1 & F2 respectively
EvoOpt.UB_F = [5 2.5];                   %set lower bound for F1 & F2 respectively
%=================================================================
output.EvoOpt = EvoOpt;

%%BioGP Optimization Configs=========================
BioOpt.obj(1) = 1 ;  %set 1 for min and -1 for max
BioOpt.obj(2) = 1 ;  %set 1 for min and -1 for max
BioOpt.Prey_popsize = 500;         %Initial popsize
BioOpt.no_Prey_preferred = 500;    %Desired popsize
BioOpt.no_new_Prey = 200;          %new prey introduced every KillInterval
BioOpt.Predator_popsize = 50;     %Number of Predators 100
BioOpt.no_generations = 100;       %max generations
BioOpt.P_move_prey = 0.5;          %Prob with which a Prey moves
BioOpt.P_mut = 0.5;                %prob of choosing a prey for mutation
%Prob of Xover is 1 for every Prey
BioOpt.F_bad = 1e5;                %fitness assigned to preys performing badly
%2D-lattice
BioOpt.no_x = 50;                  %lattice size (no of rows) 50
BioOpt.no_y = 50;                  %lattice size (no of cols) 50
BioOpt.KillInterval = 4;          %Interval at which bad preys are eliminated
BioOpt.maxrank = 20;               %maxrank retained at KillInterval
BioOpt.ploton = 1;                 %set 0 for no plots or 1 for plots at every generation
BioOpt.useConstraints = true; 
BioOpt.LB_F = [0 0];              %set upper bound for F1 & F2 respectively
BioOpt.UB_F = [5 2.5];                   %set lower bound for F1 & F2 respectively
%=================================================================
output.BioOpt = BioOpt;

%%RVEA Optimization Configs===========================
RVEAopt.Generations = 500;
RVEAopt.p1p2 = num2cell([100 0]); %%[p1 p2] define the number of reference vectors. p1 is the number of divisions along an axis
RVEAopt.N = 120;  %%defines the population size.
RVEAopt.alpha = 2; % the parameter in APD, the bigger, the faster RVEA converges
RVEAopt.fr = 0.1; % frequency to call reference vector
%=====================================================
output.RVEAopt = RVEAopt;

%%cRVEA Optimization Configs===========================
cRVEAopt.obj(1) = 1 ;  %set 1 for min and -1 for max
cRVEAopt.obj(2) = 1 ;  %set 1 for min and -1 for max
cRVEAopt.Generations = 500;
cRVEAopt.p1p2 = num2cell([100 0]); %%[p1 p2] define the number of reference vectors. p1 is the number of divisions along an axis
cRVEAopt.N = 120;  %%defines the population size.
cRVEAopt.alpha = 2; % the parameter in APD, the bigger, the faster cRVEA converges
cRVEAopt.fr = 0.1; % frequency to call reference vector

cRVEAopt.eqCon{1} = ''; %equality constraints(f(Var,Obj)=0)
cRVEAopt.ieqCon{1} = '2.5-obj2'; %inequality contraints(f(Var,Obj)>0)
%=====================================================
output.cRVEAopt = cRVEAopt;


if save_configuration
save([output.name '.mat'], 'output');
end
end