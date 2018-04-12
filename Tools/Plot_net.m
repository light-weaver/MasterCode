function Plot_net(net)
close gcf
x_dist = 15;
y_dist = 5;
radius = 1;
fntsze = 14;
axis equal
axis off
num_layers = length(net);
for layer = 1:num_layers
	x_pos_in = x_dist * (layer-1);	%for x-coord of input nodes in a layer
	x_pos_out = x_dist * layer;
	weights = net{layer};
	[num_in , num_out] = size(weights);  %might have to swap in and out
	num_in = num_in-1; %or num_out?
	for in = 1:num_in+1
		y_pos_in = (in - 1 - 0.5*num_in + 0.5) * y_dist;
		if in<num_in+1
			x_p = x_pos_in;
			center = [x_p y_pos_in];
			viscircles(center,radius,'Color','black');
			text(x_p,y_pos_in,num2str(in),'FontSize',fntsze,'HorizontalAlignment','center');
		else
			x_p = (x_pos_in+x_pos_out)/2;
			center = [x_p y_pos_in];
			viscircles(center,radius,'Color','black','LineStyle','--');
			text(x_p,y_pos_in,'bias','FontSize',fntsze,'HorizontalAlignment','center');
		end
		for out = 1:num_out
			y_pos_out = (out - 1 - 0.5*num_out + 0.5) * y_dist;
			x = [x_p x_pos_out];
			y = [y_pos_in y_pos_out];
			if in<num_in+1
				if weights(in+1,out) ~= 0
				line(x,y,'LineStyle','--','Color','r');
				txt = num2str(weights(in+1,out));
				x = (x_pos_in*out + x_pos_out*(1.1*num_out-out))/(1.1*num_out);
				y = (y_pos_in*out + y_pos_out*(1.1*num_out-out))/(1.1*num_out);
				%text(x,y,txt,'FontSize',fntsze);
				end
			else
				line(x,y,'LineStyle','-.');
			end
		end
	end
end

x_pos_in = x_pos_out;
x_pos_out = x_pos_out + x_dist;
viscircles([x_pos_out 0],radius,'Color','b');
num_in = num_out;
for in = 1:num_in
	y_pos_in = (in - 1 - 0.5*num_in + 0.5) * y_dist;
	center = [x_pos_in y_pos_in];
	viscircles(center,radius,'Color','black');
	line([x_pos_in,x_pos_out],[y_pos_in,0],'LineStyle','--','Color','r');
end