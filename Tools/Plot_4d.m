%Copy Pareto file to this directory
%Add legends, axes and title manually
%Save manually

data = importdata('filename.mat'); 
objectives = [1,3,5]; %Only 3 objectives
mrkSize = 50; %defines markersize
%=======================================
FVal = data.FuntionValue(:,objectives);
%FVal = abs(FVal); %Use if you want to use absolute values of FVal
close all
colormap jet; % change this to change colour scheme
scatter3(FVal(:,1),FVal(:,2),FVal(:,3),mrkSize,FVal(:,4))
colorbar