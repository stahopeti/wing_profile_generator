function [] = plot_3d_wing_edged(zValues,xyUpperCurved,xyLowerCurved,wing_length,numberOfPoints)
    figure(5)
    clf
    
    for j=1:1:numberOfPoints
        for i=1:1:numberOfPoints
            plot3(zValues(j), xyUpperCurved(j,i,1), xyUpperCurved(j,i,2),'.', 'Color', [0 1 0])
            hold on
            plot3(zValues(j), xyLowerCurved(j,i,1), xyLowerCurved(j,i,2),'.', 'Color', [1 0 0])
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
end

