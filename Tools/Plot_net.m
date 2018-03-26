function Plot_net(net)
x_dist = 25;
y_dist = 5;
radius = 1;
num_layers = length(net);
for layer = 1:num_layers
	x_pos_in = x_dist * (layer-1);	%for x-coord of input nodes in a layer
	x_pos_out = x_dist * layer;
	weights = net{layer};
	[num_in , num_out] = size(weights);  %might have to swap in and out
	num_in = num_in-1; %or num_out?
	for in = 1:num_in
		y_pos_in = (in - 1 - 0.5*num_in + 0.5) * y_dist;
		center = [x_pos_in y_pos_in];
		viscircles(center,radius);
		for out = 1:num_out
			y_pos_out = (out - 1 - 0.5*num_out + 0.5) * y_dist;
			x = [x_pos_in x_pos_out];
			y = [y_pos_in y_pos_out];
			txt = num2str(weights(in+1,out));
			line(x,y);
			x = (x_pos_in*out + x_pos_out*(1.1*num_out-out))/(1.1*num_out);
			y = (y_pos_in*out + y_pos_out*(1.1*num_out-out))/(1.1*num_out);
			text(x,y,txt);
		end
	end
end

x_pos_in = x_pos_out;
x_pos_out = x_pos_out + x_dist;
viscircles([x_pos_out 0],radius);
num_in = num_out;
for in = 1:num_in
	y_pos_in = (in - 1 - 0.5*num_in + 0.5) * y_dist;
	center = [x_pos_in y_pos_in];
	viscircles(center,radius);
	line([x_pos_in,x_pos_out],[y_pos_in,0]);
end