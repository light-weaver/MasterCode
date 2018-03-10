%Copy Pareto file to this directory
%Add legends, axes and title manually
%Save manually

data = importdata('filename.mat'); 
objectives = [1,3,5]; %Only 3 objectives
%=======================================
FVal = data.FunctionValue(:,objectives);
close all
scatter3(FVal(:,1),FVal(:,2),FVal(:,3),'r');