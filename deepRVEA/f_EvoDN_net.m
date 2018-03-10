function Beta_out = f_EvoDN_net(Population,parameters,select,savedir,y)
    no_layer = length(Population);
	w = Population;
	out = parameters.dataset.out;
	no_points = length(out);
	max_index = size(w{1},1);
	Beta_out = {};
	for index = 1:max_index
		in = parameters.dataset.in;
		net = {};
		for layer = 1:no_layer
			net{layer}(:,:) = squeeze(w{layer}(index,:,:));  
		end
		for layer = 1:no_layer  %-1?
			in = in*net{layer}(2:end,:);
			bias = net{layer}(1,:);
			in = in+bias;
			in = 1./(1+exp(-in));
		end
		%% LLSQ to solve in*Beta = out
		Beta = in\out;
		modelout = in*Beta;
		Beta_out{index} = Beta;
		if index == select
			hold on
			plot(out,modelout,'kd','LineWidth', 2)
			pol = polyfit(out,modelout,1);
			ylim=get(gca,'ylim');
			xlim=get(gca,'xlim');
			text(xlim(1)+0.1*(xlim(2)-xlim(1)),ylim(2),['\fontsize{12} \color{red} Slope =' num2str(pol(1))])
			pol = pol(1)*out + pol(2);
			plot(out,pol, '.-b', 'LineWidth', 2)
			saveas(gcf,[savedir '/' y 'PredVsExp.fig']);
			saveas(gcf,[savedir '/' y 'PredVsExp.jpg']);
			hold off
			plot([1:no_points],out,'--o',[1:no_points],modelout,'-or')
			saveas(gcf,[savedir '/' y 'Pred_Exp.jpg']);
			saveas(gcf,[savedir '/' y 'Pred_Exp.fig']);
		end
	end
end