function [] = plot_edges_of_wing(zValues, edgeFrontX, edgeBackX, numberOfPoints)
    figure(4)
    clf
    plot(zValues(1:numberOfPoints), edgeFrontX(1:numberOfPoints));
    hold on
    plot(zValues(1:numberOfPoints), edgeBackX(1:numberOfPoints));
    ylim([0 2])
    grid on
    figure(5)
    clf
end

