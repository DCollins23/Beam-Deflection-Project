% Deflecion Calculations (Davey and Braeden)
% The UDF for the deflection
function [x,y] = DeflectionCalculation(I,E,a,L,F,loadType,Load, ...
    BeamSupportType,BeamSupport)
% Assigns 1000 values between 0 and a, a and L, and 0 and L. (Total of
% 3000)
x1 = linspace(0,a,1000);
x2 = linspace(a,L,1000);
x3 = linspace(0,L,2000);
% Calculates b and w used in the calculations below.
b2 = L-a;
w = F/L;


% If the user chooses point and cantilever
if isequal(loadType{Load},loadType{1}) && isequal(BeamSupportType ...
        {BeamSupport},BeamSupportType{1})
    % Since this equation is for 0<x<a, x1 is used in the equation.
    for i = 1:1000
        y1(i) = ((F*(x1(i))^2)/(6*E*I))*((3*a)-x1(i));
    end
    % Since this equation is for a<x<L, x2 is used in the equation.
    for j = 1:1000
        y2(j) = ((F*(a^2))/(6*E*I))*((3*x2(j))-a);
    end
    % Concatenates x1 and x2 for x and y1 and y2 for y. This gives each one
    % 2000 values
    x = [x1 x2];
    y = [y1 y2];
% If the user chooses point and simply supported
elseif isequal(loadType{Load},loadType{1}) && isequal(BeamSupportType{BeamSupport},BeamSupportType{2})
    for k = 1:1000
        y1(k) = ((F*b2*x1(k))/(6*E*L*I))*((L^2)-(x1(k)^2)-(b2^2));
    end
    for l = 1:1000
        y2(l) = ((F*b2)/(6*E*L*I))*(((L/b2)*((x2(l)-a)^3))+((L^2-b2^2)*x2(l))-(x2(l)^3));
    end
    x = [x1 x2];
    y = [y1 y2];
% If the user chooses uniform and cantilever
elseif isequal(loadType{Load},loadType{2}) && isequal(BeamSupportType{BeamSupport},BeamSupportType{1})
    for m = 1:2000
    y(m) = ((w*(x3(m)^2)/(24*E*I)))*((x3(m)^2)+(6*L^2)-(4*L*x3(m)));
    end
    % Since there is no piecewise function
    x = x3;
% If the user chooses uniform and simply supported
elseif isequal(loadType{Load},loadType{2}) && isequal(BeamSupportType{BeamSupport},BeamSupportType{2})
    for n = 1:2000
        y(n) = ((w*(x3(n))/(24*E*I)))*(L^3-(2*L*x3(n)^2)+(x3(n)^3));
    end
    x = x3;
end








