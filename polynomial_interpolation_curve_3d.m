#Polynomial Lagrange interpolation of a curve in 3d space
curve_resolution = 100;
n_points = 13;
points_x = transpose(sin(linspace(0,4*pi,n_points)));
points_y = transpose(cos(linspace(0,4*pi,n_points)));
points_z = transpose(linspace(0,1,n_points));

points_lin = linspace(0,1,n_points);
matrix = fliplr(vander(points_lin));
coefficients_x = matrix\points_x;
coefficients_y = matrix\points_y;
coefficients_z = matrix\points_z;
t=linspace(0,1,curve_resolution);
for i=1:curve_resolution
	curve_x(i)=0;
	curve_y(i)=0;
	curve_z(i)=0;
	for grad=1:n_points
		curve_x(i)+=coefficients_x(grad)*power(t(i),grad-1);
		curve_y(i)+=coefficients_y(grad)*power(t(i),grad-1);
		curve_z(i)+=coefficients_z(grad)*power(t(i),grad-1);
	end
end
plot3(points_x,points_y,points_z,"^r",curve_x,curve_y,curve_z)