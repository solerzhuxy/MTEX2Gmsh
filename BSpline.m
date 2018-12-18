function [Xbs,Ybs] = BSpline(X,Y,nint)
%BSPLINE computes the B-spline approximation.
% [Xbs,Ybs]=BSPLINE(X,Y) returns the coordinates (Xbs,Ybs) using squared 
% B-spline approximation.
% BSPLINE(X,Y,n) use n interpolation points per interval (default: 10)
	if nargin<3
		nint=10;
	end
	npt=numel(X);
	if npt~=numel(Y)
		error('X and Y must contain the same number of elements')
	end
 	if npt<=2
 		Xbs=X(:);
 		Ybs=Y(:);
 		return
 	end
	nint=nint*(npt-1)+1;
	y = linspace(0,1,nint);

	order=3;
	Xl = zeros(order);
	Yl = zeros(order);
	t = [zeros(1,order-1),linspace(0,1,npt-order+2),ones(1,order-1)];

	Xbs=zeros(nint,1);
	Ybs=Xbs;
	for m = 1:nint-1
		t0 = y(m);
		k = find(t0 >= t,1,'last');
		if (k > npt)
			Xbs=Xbs(1:m-1,:);
			Ybs=Ybs(1:m-1,:);
			return;
		end
		Xl(:,1) = X(k-order+1:k);
		Yl(:,1) = Y(k-order+1:k);

		for i = 2:order
			for j = i:order
				num = t0-t(k-order+j);
				if num == 0
					wt = 0;
				else
					s = t(k+j-i+1)-t(k-order+j);
					wt = num/s;
				end
				Xl(j,i) = (1-wt)*Xl(j-1,i-1) + wt*Xl(j,i-1);
				Yl(j,i) = (1-wt)*Yl(j-1,i-1) + wt*Yl(j,i-1);
			end
		end
		Xbs(m) = Xl(order,order);
		Ybs(m) = Yl(order,order);
	end
	Xbs(end)=X(end);
	Ybs(end)=Y(end);
end

