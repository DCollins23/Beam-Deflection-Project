
% Moment of Intertia (Davey and Braeden)

% UDF to determine the moment of inertia
function [I] = MomentOfInertia(b,h,t,crossSectionShape,crossSection)

% Moment of inertia calculation for solid rectangle
if isequal(crossSectionShape{crossSection},crossSectionShape{1})
    I = (b*h^3)/12;
% Calculation for hollow rectangle
elseif isequal(crossSectionShape{crossSection},crossSectionShape{2})
    I = ((b*h^3)/12)-(((b-(2*t))*((h-(2*t)))^3)/12);
% Calculation for I-beam
elseif isequal(crossSectionShape{crossSection},crossSectionShape{3})
    I = ((2*t*b)*((1/2)*(h-(2*t))+((1/2)*t))^2)+((t*((h-(2*t))^3))/12);
% Calculation for T-beam. Y is a separate variable for simplification
% of equation.
elseif isequal(crossSectionShape{crossSection},crossSectionShape{4})
    % My code:
    yc = h - ((t*h^2 + t^2*(b-t))/(2*(b*t + (h-t)*t)));
    I = (1/3)*(t*yc^3 + b*(h-yc)^3 - (b-t)*(h-yc-t)^3);
    
    % Your code:
%     y = h-((t*h^2)+((t^2)*(b-t))/(2*((b*t)+(t*(h-t)))));
%     I = (1/3)*((t*y^3)+(b*((h-y)^3))-((b-t)*((h-y-t)^3)));
end


