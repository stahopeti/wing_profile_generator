% NACA 4 digit airfoil camber/
% MPXX
M=double(2);
P=double(4);
XX=12;
M=(M/100);
P=(P/10);

% number of points the space is divided for the modeling
numberOfPoints=51;
initWithZeros = zeros(numberOfPoints, 1);

% function to calculate below parameters
[xyUpper, xyLower, xyCamber] = calculate_2d_profile(M, P, XX, numberOfPoints);

% plotting 2d profile
% plot_2d_profile(xyCamber,xyUpper, xyLower, numberOfPoints);

% plotting profile in 3d with points
wing_length = 10;
zValues = linspace(0,wing_length,numberOfPoints);
% plot_3d_profile_points(zValues,wing_length,xyUpper,xyLower,numberOfPoints)

% plotting profile in 3d with trimesh
% plot_3d_profile_mesh(zValues,wing_length,xyUpper,xyLower,numberOfPoints)

% edgeFrontX and edgeBackX is one dimensional, contains X values for wing
% curve
[edgeFrontX,edgeBackX] = calculate_edges_of_wing(numberOfPoints, wing_length, P, .5);

% plot_edges_of_wing(zValues, edgeFrontX, edgeBackX, numberOfPoints)
[xyUpperCurved, xyLowerCurved] = calculate_3d_wing_edged(zValues,xyUpper,xyLower,edgeFrontX,edgeBackX,P,wing_length,numberOfPoints);
% [xyUpperTemp, xyLowerTemp] = calculate_3d_wing_edged(xyUpper,xyLower,edgeFrontX,edgeBackX,P,numberOfPoints);
plot_3d_wing_edged(zValues,xyUpperCurved,xyLowerCurved,wing_length,numberOfPoints)
