#Polynomial Lagrange interpolation of a curve in 2d space
curve_resolution = 100;
n_points = 24;
points_x = transpose(sin(linspace(0,2*pi,n_points)));
points_y = transpose(cos(linspace(0,5*pi,n_points)));

points_lin = linspace(0,1,n_points);
matrix = fliplr(vander(points_lin));
coefficients_x = matrix\points_x;
coefficients_y = matrix\points_y;
t=linspace(0,1,curve_resolution);
for i=1:curve_resolution
	curve_x(i)=0;
	curve_y(i)=0;
	for grad=1:n_points
		curve_x(i)+=coefficients_x(grad)*power(t(i),grad-1);
		curve_y(i)+=coefficients_y(grad)*power(t(i),grad-1);
	end
end
plot(points_x,points_y,"^r",curve_x,curve_y)