#Surfaces built with a monomial basis
order = 4;
surface_resolution = 16;
colormap(jet);
surf_lin = linspace (-1, 1, surface_resolution);
[xx, yy] = meshgrid (surf_lin, surf_lin);
matrix = zeros(surface_resolution,surface_resolution);
for i=1:order
	for j=1:order
		for x=1:surface_resolution
			for y=1:surface_resolution
				matrix(x,y)=  xx(x,y) ^(j-1) * yy(x,y) ^(i-1);
			end
		end
		subplot(order,order, i+(j-1)*order)
		mesh(xx,yy,matrix)
	end
end