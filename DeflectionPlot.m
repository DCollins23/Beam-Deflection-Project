% Deflection plot (Davey)

% UDF for the plotting of the graph
function [] = DeflectionPlot(x,y,BeamSupportType,BeamSupport,F,loadType, ...
    Load,Material,crossSectionShape,crossSection)

figure(1)
% Plots the location along the beam as the x and and deflection of the beam
% as the y. y is subtracted from zero because 0 is the undeflected
% position
plot(x,-y)

% ylim([-0.005 0.001]) Removed because graph wasn't showing
hold on
% Plots a dotted line for the undeflected position of the graph
yline(0,'--')
% Labels the x and y axes
xlabel('Location Along the Beam (inches)')
ylabel('Beam Deflection (inches)')
% Variables for the title of the plot
plotTitle = sprintf(['Beam Deflection for a %s Beam\n (%0.0f lb. %s load' ...
    ' applied to a %s %s Beam)\n'], ...
    BeamSupportType{BeamSupport},F,loadType{Load},Material, ...
    crossSectionShape{crossSection});
title(plotTitle)
