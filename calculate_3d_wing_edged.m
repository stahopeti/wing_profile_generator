function [xyUpperCurved, xyLowerCurved] = calculate_3d_wing_edged(xyUpper, xyLower, edgeFrontX, edgeBackX, numberOfPoints)
    xyUpperCurved=zeros(numberOfPoints,numberOfPoints,2);
    xyLowerCurved=zeros(numberOfPoints,numberOfPoints,2);
    xyUpperTemp=xyUpper;
    xyLowerTemp=xyLower;

    for j=1:1:numberOfPoints
        for i=1:1:numberOfPoints
            if(xyUpper(i,1)<.5)
                xyUpperTemp(i,1) = ((xyUpper(i,1) + (1-(xyUpper(i,1)/.5))*edgeFrontX(j)));
            else
                xyUpperTemp(i,1) = -(xyUpper(i,1) + (1-(xyUpper(i,1)/.5))*edgeBackX(j)) + 1;
            end
            if(xyLower(i,1)<.5)
                xyLowerTemp(i,1) = ((xyLower(i,1) + (1-(xyLower(i,1)/.5))*edgeFrontX(j)));
            else
                xyLowerTemp(i,1) = -(xyLower(i,1) + (1-(xyLower(i,1)/.5))*edgeBackX(j)) + 1;
            end
            xyUpperCurved(j,i,1) = xyUpperTemp(i,1);
            xyUpperCurved(j,i,2) = xyUpperTemp(i,2);
            xyLowerCurved(j,i,1) = xyLowerTemp(i,1);
            xyLowerCurved(j,i,2) = xyLowerTemp(i,2);
        end
    end
end