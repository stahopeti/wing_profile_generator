% calculate edge points for given number of points
% in the profile generator, these points would lie on the Z plane
% ypoints should be in the 0->1 space
% TODO: parametric function generation based on base and end of wing
% zValues,xyUpper,xyLower,edgeFrontX,edgeBackX,P,wing_length,numberOfPoints
function [edgeFront, edgeBack] = calculate_edges_of_wing(numberOfPoints, wing_length, P, startEndProportions)
    halfOfStartEndDiff = (1 - startEndProportions)/2;
    xpoints = linspace(0,wing_length,numberOfPoints);
    edgeFront = zeros(numberOfPoints,1);
    edgeBack = zeros(numberOfPoints,1);
    for i=1:1:numberOfPoints
        edgeFront(i) = 0 + halfOfStartEndDiff*(xpoints(i)/wing_length);
        edgeBack(i) = 1 - halfOfStartEndDiff*(xpoints(i)/wing_length);
    end   
end

