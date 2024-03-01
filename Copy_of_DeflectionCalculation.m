% Deflecion Calculations (Davey and Braeden)
% The UDF for the deflection
function [x,y7,y8,y9] = Copy_of_DeflectionCalculation(I,E1,E2,E3,a,L,F)
% Assigns 1000 values between 0 and a, a and L, and 0 and L. (Total of
% 3000)
x1 = linspace(0,a,1000);
x2 = linspace(a,L,1000);


% Chromium
% Since this equation is for 0<x<a, x1 is used in the equation.
for i = 1:1000
    y1(i) = ((F*(x1(i))^2)/(6*E1*I))*((3*a)-x1(i));
end
% Since this equation is for a<x<L, x2 is used in the equation.
for j = 1:1000
    y2(j) = ((F*(a^2))/(6*E1*I))*((3*x2(j))-a);
end

y7 = [y1 y2];

% Lead
for i = 1:1000
    y3(i) = ((F*(x1(i))^2)/(6*E2*I))*((3*a)-x1(i));
end
% Since this equation is for a<x<L, x2 is used in the equation.
for j = 1:1000
    y4(j) = ((F*(a^2))/(6*E2*I))*((3*x2(j))-a);
end
% Concatenates y3 and y4 for y.
y8 = [y3 y4];

% Titanium
for i = 1:1000
    y5(i) = ((F*(x1(i))^2)/(6*E3*I))*((3*a)-x1(i));
end
% Since this equation is for a<x<L, x2 is used in the equation.
for j = 1:1000
    y6(j) = ((F*(a^2))/(6*E3*I))*((3*x2(j))-a);
end
% Concatenates x1 and x2 for x and y1 and y2 for y. This gives each one
% 2000 values
x = [x1 x2];
y9 = [y5 y6];








