function [xyUpper, xyLower, xyCamber] = calculate_2d_profile(M, P, XX, numberOfPoints)
    initWithZeros = zeros(numberOfPoints, 1);
    %populating x values from 0->1 ca~camber array
    %init variables
    xCamber=linspace(0,1,numberOfPoints)';
    yCamber=initWithZeros;
    xyCamber=[xCamber yCamber];
    yHalfThickness=initWithZeros;
    xyUpper=initWithZeros;
    phi=initWithZeros;
    xyLower=initWithZeros;
    for i=1:1:numberOfPoints
        % derivative of yc
        dyc=initWithZeros;

        xi=xyCamber(i,1);
        yCamberi=0;
        % first: 0 <= x <= P
        if(0 <= xi && xi < P)
            yCamberi=(M/P^2)*((2*P*xi)-(xi*xi));
            dyc(i)=2*M/P^2*(P-xi);
        % second: P <= x <= numberOfPoints
        elseif (P <= xi && xi <= numberOfPoints)
            yCamberi=(M/(1-P)^2)*(1-(2*P)+(2*P*xi)-(xi*xi));
            dyc(i)=2*M/(1-P)^2*(P-xi);
        end
        xyCamber(i,2)=yCamberi;
        % calculate half-thickness at every x
        % a0=0.2969; a1=0.1260; a2=0.3516; a3=0.2843; a4=0.1015;
        yHalfThickness(i)=5*(XX/100)*(0.2969*sqrt(xi)-0.1260*xi-0.3516*xi^2+0.2843*xi^3-0.1015*xi^4);
        % calculate angle of deviation
        phi(i)=atan(dyc(i));
        % calculate upper and lower part of the airfoil
        % xUpper=x-yt*sin(phi) and xLower=x+yt*sin(phi)
        % yUpper=yc+yt*cos(phi) and yLower=yt-yt*cos(phi)
        xyUpper(i,1)=xi-yHalfThickness(i)*sin(phi(i)); xyUpper(i,2)=yCamberi+yHalfThickness(i)*cos(phi(i));
        xyLower(i,1)=xi+yHalfThickness(i)*sin(phi(i)); xyLower(i,2)=yCamberi-yHalfThickness(i)*cos(phi(i));

        % inverting the y values because we are generating a spoiler
        % xyU(i,2) = xyU(i,2)*(-1);
        % xyL(i,2) = xyL(i,2)*(-1);
        % cca(i,2) = cca(i,2)*(-1);
    end
end

