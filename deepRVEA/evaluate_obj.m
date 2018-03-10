function out=evaluate_obj(data,Setslog)
	net = Setslog.net;
	no_layer = length(net);
	Beta = Setslog.Beta;
	in = data;
	for layer = 1:no_layer  %-1?
		in = in*net{layer}(2:end,:);
		bias = net{layer}(1,:);
		in = in+bias;
		in = 1./(1+exp(-in));
	end
	out = in*Beta;
end