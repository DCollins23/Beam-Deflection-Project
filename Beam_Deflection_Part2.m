
% Braeden Mayhew and Davey Collins
% EA3
% 7th Period
% Started: 11-8-21


clear, clc, clf
%% Start

b = 4;
h = 4;
t = 0.25;
crossSectionShape = {'Solid Rectangle','Hollow Rectangle','I-Beam','T-Beam'};
crossSection = 1;
L = 50;
F = 200;
a = 20;
BeamSupportType = {'Cantilevered','Simply Supported'};
BeamSupport = 1;
loadType = {'Point','Uniform'};
Load = 1;

% Chromium
E1 = (36.0*(10^6));

% Lead
E2 = (2.6*(10^6));

% Titanium
E3 = (16.8*(10^6));


% Calculates and assigns inertia to a variable. The inertia is calculated 
% in separate UDF
[I] = MomentOfInertia(b,h,t,crossSectionShape,crossSection);
% This is the UDF to calculate the deflection of the beam.
[x,y7,y8,y9] = Copy_of_DeflectionCalculation(I,E1,E2,E3,a,L,F);
% Plots the deflection
Copy_of_DeflectionPlot(x,y7,y8,y9,BeamSupportType, ...
    BeamSupport,F,loadType,Load,crossSectionShape,crossSection)



