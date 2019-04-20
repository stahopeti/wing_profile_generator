function [] = plot_2d_profile(xyCamber,xyUpper, xyLower, numberOfPoints)
    figure(1)
    clf
    hold on
    plot(xyCamber(1:numberOfPoints,1), xyCamber(1:numberOfPoints,2), 'r')
    plot(xyUpper(1:numberOfPoints,1), xyUpper(1:numberOfPoints,2), 'g')
    plot(xyLower(1:numberOfPoints,1), xyLower(1:numberOfPoints,2), 'g')

    grid on
    set(gca,'Color','k')
    ax=gca;
    ax.GridColor=[1, 1, 0];
    xlim([0 1])
    ylim([-.5 .5])
end

