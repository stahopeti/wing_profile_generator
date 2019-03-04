% NACA 4 digit airfoil camber/
% MPXX
M=double(2);
P=double(4);
XX=12;
M=(M/100);
P=(P/10);

% number of points the space is divided for the modeling
numberOfPoints=1001;

%populating x values from 1 to 1000 ca~camber array
x=linspace(0,1,numberOfPoints)';
yc=ones(numberOfPoints, 1);
cca=[x yc];

% derivative of  yc
dyc=ones(numberOfPoints, 1);
% half thickness at given x point
yt=ones (1, numberOfPoints)';
a0=0.2969; a1=0.1260; a2=0.3516; a3=0.2843; a4=0.1015;

% angle deviation of xUpper and xLower from x => arctan(dyc)
phi=ones(numberOfPoints, 1);
xyU=[ones(numberOfPoints, 1) ones(numberOfPoints, 1)];
xyL=[ones(numberOfPoints, 1) ones(numberOfPoints, 1)];

% y value for camber is calculated from M and P and x, and 
% there are two cases
for i=1:1:numberOfPoints
    xi=cca(i,1);
    yci=0;
    % first: 0 <= x <= P
    if(0 <= xi && xi < P)
        yci=(M/P^2)*((2*P*xi) - (xi*xi));
        dyc(i)=2*M/P^2 * (P-xi);
    % second: P <= x <= numberOfPoints
    elseif (P <= xi && xi <= numberOfPoints)
        yci=(M/(1-P)^2) * (1 - (2*P) + (2*P*xi) - (xi*xi));
        dyc(i)=2*M/(1-P)^2 * (P-xi);
    end
    cca(i,2)=yci;
    % calculate half-thickness at every x
    yt(i)=5*(XX/100)*(a0*sqrt(xi)-a1*xi-a2*xi^2+a3*xi^3-a4*xi^4);
    % calculate angle of deviation
    phi(i)=atan(dyc(i));
    % calculate upper and lower part of the airfoil
    % xUpper=x-yt*sin(phi) and xLower=x+yt*sin(phi)
    % yUpper=yc+yt*cos(phi) and yLower=yt-yt*cos(phi)
    xyU(i,1)=xi-yt(i)*sin(phi(i)); xyU(i,2)=yci+yt(i)*cos(phi(i));
    xyL(i,1)=xi+yt(i)*sin(phi(i)); xyL(i,2)=yci-yt(i)*cos(phi(i));
    
    % inverting the y values because we are generating a spoiler
    xyU(i,2) = xyU(i,2)*(-1);
    xyL(i,2) = xyL(i,2)*(-1);
    cca(i,2) = cca(i,2)*(-1);
end

figure(1) 
hold on
plot(cca(1:numberOfPoints,1), cca(1:numberOfPoints,2), 'r')
plot(xyU(1:numberOfPoints,1), xyU(1:numberOfPoints,2), 'g')
plot(xyL(1:numberOfPoints,1), xyL(1:numberOfPoints,2), 'g')

grid on
set(gca,'Color','k')
ax=gca;
ax.GridColor=[1, 1, 0];
xlim([0 1])
ylim([-.5 .5])
