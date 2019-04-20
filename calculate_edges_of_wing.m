% calculate edge points for given number of points
% in the profile generator, these points would lie on the Z plane
% ypoints should be in the 0->1 space
% TODO: parametric function generation based on base and end of wing
% zValues,xyUpper,xyLower,edgeFrontX,edgeBackX,P,wing_length,numberOfPoints
function [edgeFront, edgeBack] = calculate_edges_of_wing(numberOfPoints, wing_length, P)
    xpoints = linspace(0,wing_length, numberOfPoints);
    ypointsFront = zeros(numberOfPoints,1);
    ypointsBack = zeros(numberOfPoints,1);
    for i=1:1:numberOfPoints
        ypointsFront(i) = sqrt(xpoints(i));
        ypointsBack(i) = -(sqrt(xpoints(i)));
    end
    edgeFront = rescale(ypointsFront, 0,(1-P)); edgeBack = rescale(ypointsBack, 0, P);
    for i=1:1:numberOfPoints
        edgeFront(i) = edgeFront(i)+P;
    end    
end

