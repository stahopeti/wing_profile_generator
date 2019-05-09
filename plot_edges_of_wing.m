function [] = plot_edges_of_wing(zValues, edgeFrontX, edgeBackX, numberOfPoints)
    figure(4)
    clf
    plot(zValues(1:numberOfPoints), edgeFrontX(1:numberOfPoints));
    hold on
    plot(zValues(1:numberOfPoints), edgeBackX(1:numberOfPoints));
    ylim([0 1])
    grid on
    ax=gca;
    ax.GridColor=[1, 1, 0];
    set(gca, 'YDir', 'reverse')
    set(gca,'Color','k')
    xlabel('Z')
    ylabel('X')
    grid on
    figure(5)
    clf
end

