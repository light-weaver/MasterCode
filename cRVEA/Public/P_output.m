function P_output (Population,time,Algorithm,Problem,M, obj_val,savedir,obj,eqCon,ieqCon)

FunctionValue = P_objective('value',obj_val,M,Population,obj,eqCon,ieqCon);
if(strcmp(Algorithm, 'cRVEA'))
    FunctionValue = FunctionValue(:,1:end - 1);
end;

NonDominated  = P_sort(FunctionValue,'first')==1;
Population    = Population(NonDominated,:);
FunctionValue = FunctionValue(NonDominated,:);

if(M == 2)
    plot(FunctionValue(:,1), FunctionValue(:,2), 'ro', 'MarkerFace', 'r');
    %xlim([0 max(FunctionValue(:,1)) + 0.1]);
    %ylim([0 max(FunctionValue(:,2)) + 0.1]);
    xlabel('f_1');ylabel('f_2');
    hold off;
else
    plot3(FunctionValue(:,1), FunctionValue(:,2), FunctionValue(:,3), 'ro','MarkerFace', 'r');
    xlim([0 max(FunctionValue(:,1)) + 0.1]);
    ylim([0 max(FunctionValue(:,2)) + 0.1]);
    zlim([0 max(FunctionValue(:,3)) + 0.1]);
    xlabel('f_1', 'FontSize', 14);ylabel('f_2', 'FontSize', 14);zlabel('f_3', 'FontSize', 14);
    view(135, 30);
    hold off;
end;
eval(['save ' savedir '/cRVEAopt.mat Population FunctionValue time'])
saveas(gcf, [savedir '/cRVEA_Pareto.jpg'])
end


