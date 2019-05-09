function [] = plot_3d_profile_mesh(zValues,wing_length,xyUpper,xyLower,numberOfPoints)
    figure(3)
    clf
    grid on

    [xPointsUpper,zPointsUpper] = meshgrid(xyUpper(1:numberOfPoints,1)',zValues(1:numberOfPoints));
    [xPointsLower,zPointsLower] = meshgrid(xyLower(1:numberOfPoints,1)',zValues(1:numberOfPoints));

    yPointsUpper=repmat(xyUpper(1:numberOfPoints,2)',numberOfPoints,1);
    yPointsLower=repmat(xyLower(1:numberOfPoints,2)',numberOfPoints,1);

    % trimesh is xyz, I put in coordinates in different order, zxy
    tri = delaunay(zPointsUpper,xPointsUpper);trimesh(tri,zPointsUpper,xPointsUpper,yPointsUpper) 
    hold on
    tri = delaunay(zPointsLower,xPointsLower);trimesh(tri,zPointsLower,xPointsLower,yPointsLower) 
    hold on
    zlim([-.5 .5]) % y is z
    xlim([0 wing_length]) % z is x
    xlabel('Z')
    ylabel('X')
    zlabel('Y')
    ax=gca;
    set(gca, 'Ydir', 'reverse')
end

