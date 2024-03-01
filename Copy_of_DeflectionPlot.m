% Deflection plot (Davey)

% UDF for the plotting of the graph
function [] = Copy_of_DeflectionPlot(x,y7,y8,y9,BeamSupportType, ...
    BeamSupport,F,loadType,Load,crossSectionShape,crossSection)

figure(1)
% Plots the location along the beam as the x and and deflection of the beam
% as the y. y is subtracted from zero because 0 is the undeflected
% position
plot(x,-y7,'b','DisplayName','Chromium')
hold on
plot(x,-y8,'r','DisplayName','Lead')
plot(x,-y9,'k','DisplayName','Titanium')
ylim([-0.005 0.001])
% Plots a dotted line for the undeflected position of the graph
yline(0,'--','DisplayName','Undeflected Beam')
% Labels the x and y axes
xlabel('Location Along the Beam (inches)')
ylabel('Beam Deflection (inches)')
legend('show')
% Variables for the title of the plot
plotTitle = sprintf(['Beam Deflection for a %s Beam\n (%0.0f lb. %s load' ...
    ' applied to a %s Beam)\n'], ...
    BeamSupportType{BeamSupport},F,loadType{Load}, ...
    crossSectionShape{crossSection});
title(plotTitle)
