function [] = plot_3d_profile_points(zValues,wing_length,xyUpper,xyLower,numberOfPoints)
    figure(2)
    clf
    for j=1:1:numberOfPoints
        for i=1:1:numberOfPoints
            % plot3 is xyz, I put in coordinates in different order, zxy
            plot3(zValues(j),xyUpper(i,1),xyUpper(i,2),'.','Color',[0 1 0])
            plot3(zValues(j),xyLower(i,1),xyLower(i,2),'.','Color',[1 0 0])
            hold on
        end
    end

    grid on
    ylim([0 1])
    zlim([-.5 .5])
    xlim([0 wing_length])
    set(gca,'Color','k')
    ax=gca;
    ax.GridColor=[1, 1, 0];
    set(gca, 'Ydir', 'reverse')
    xlabel('Z')
    ylabel('X')
    zlabel('Y')
end

