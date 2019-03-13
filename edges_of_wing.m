% calculate edge points for given number of points
% in the profile generator, these points would lie on the Z plane
% ypoints should be in the 0->1 space
function [edgeFront, edgeBack] = edges_of_wing(numberOfPoints, length, P)
    xpoints = linspace(0,length, numberOfPoints);
    ypointsFront = zeros(numberOfPoints,1);
    ypointsBack = zeros(numberOfPoints,1);
    for i=1:1:numberOfPoints
        ypointsFront(i) = sqrt(xpoints(i));
        ypointsBack(i) = -(sqrt(xpoints(i)));
    end
    edgeFront = rescale(ypointsFront, 0,P); edgeBack = rescale(ypointsBack, 0, 1-P);
    for i=1:1:numberOfPoints
        edgeFront(i) = edgeFront(i)+(1-P);
    end
end

