function [xyUpperCurved, xyLowerCurved] = calculate_3d_wing_edged(zValues,xyUpper,xyLower,edgeFrontX,edgeBackX,P,wing_length,numberOfPoints)
    figure(5)
    clf
    
    xyUpperCurved=zeros(numberOfPoints,numberOfPoints,2);
    xyLowerCurved=zeros(numberOfPoints,numberOfPoints,2);
    xyUpperTemp=xyUpper;
    xyLowerTemp=xyLower;
    
    for j=1:1:numberOfPoints
        for i=1:1:numberOfPoints
            % If xyUx<P 
            if(xyUpper(i,1)<P)
                if(xyUpper(i,1)>0)
                    xyUpperTemp(i,1) = ((xyUpper(i,1) - (1-(xyUpper(i,1)/P))*edgeFrontX(j))*P) ;
                else
                    xyUpperTemp(i,1) = ((xyUpper(i,1) - edgeFrontX(j))*P);
                end
            else
                if(xyUpper(i,1)>0)
                    xyUpperTemp(i,1) = ((xyUpper(i,1) + (1-(xyUpper(i,1)/P))*edgeBackX(j))*P);
                else
                    xyUpperTemp(i,1) = (((xyUpper(i,1) + edgeBackX(j)))*P);
                end
            end
            % If xyL<P 
            if(xyLower(i,1)<P)
                if(xyLower(i,1)>0)
                    xyLowerTemp(i,1) = ((xyLower(i,1) - (1-(xyLower(i,1)/P))*edgeFrontX(j))*P);
                else
                    xyLowerTemp(i,1) = ((xyLower(i,1) - edgeFrontX(j))*P);
                end
            else
                if(xyUpper(i,1)>0)
                    xyLowerTemp(i,1) = ((((xyLower(i,1) + (1-(xyLower(i,1)/P))*edgeBackX(j))))*P);
                else
                    xyLowerTemp(i,1) = ((xyLower(i,1) + edgeBackX(j))*P);
                end
            end
            xyUpperTemp(i,1) = (xyUpperTemp(i,1)/P/2)+.5;
            xyLowerTemp(i,1) = (xyLowerTemp(i,1)/P/2)+.5;
            xyUpperCurved(j,i,1) = xyUpperTemp(i,1);
            xyUpperCurved(j,i,2) = xyUpperTemp(i,2);
            xyLowerCurved(j,i,1) = xyLowerTemp(i,1);
            xyLowerCurved(j,i,2) = xyLowerTemp(i,2);
        end
    end
end