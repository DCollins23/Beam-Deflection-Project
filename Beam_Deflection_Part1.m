% Braeden Mayhew and Davey Collins
% EA3
% 7th period
% Date Started: 11-1-21

clear, clc, clf
%% Start

% Asks user for the shape of the cross section of the beam
crossSectionShape = {'Solid Rectangle','Hollow Rectangle','I-Beam','T-Beam'};
crossSection = listdlg("PromptString",['What is the cross-sectional shape ' ...
    'of the beam?'], ...
    'SelectionMode','single','ListString',crossSectionShape,'ListSize', ...
    [400 400],'Name','Cross-sectional Shape');

% This will change the dimensions that the user is asked for based on the 
% type of cross section. It assigns the values to variables and then 
% converts the data type of the inputted values from string to double 
% precision
if isequal(crossSectionShape{crossSection},crossSectionShape{1})
    Title1 = 'Solid Rectangle Dimensions';
    prompt1 = {'Enter the base of the beam in inches.',['Enter the height ' ...
        'of the beam in inches.']};
    defaultAns1 = {'10','20'};
    solidRectangle = inputdlg(prompt1,Title1,1,defaultAns1);
    b = str2double(solidRectangle{1});
    h = str2double(solidRectangle{2});
    t = 0;
elseif isequal(crossSectionShape{crossSection},crossSectionShape{2})
    Title1 = 'Hollow Rectangle Dimensions';
    prompt1 = {'Enter the base of the beam in inches.',['Enter the height ' ...
     'of the beam in inches.'],'Enter the thickness of the beam in inches.'};
    defaultAns1 = {'10','20','2'};
    hollowRectangle = inputdlg(prompt1,Title1,1,defaultAns1);
    b = str2double(hollowRectangle{1});
    h = str2double(hollowRectangle{2});
    t = str2double(hollowRectangle{3});
elseif isequal(crossSectionShape{crossSection},crossSectionShape{3})
    Title1 = 'T-beam Dimensions';
    prompt1 = {'Enter the base of the beam in inches.',['Enter the height ' ...
  'of the beam in inches.'],'Enter the thickness of the beam in inches.'};
    defaultAns1 = {'10','20','2'};
    Tbeam = inputdlg(prompt1,Title1,1,defaultAns1);
    b = str2double(Tbeam{1});
    h = str2double(Tbeam{2});
    t = str2double(Tbeam{3});
elseif isequal(crossSectionShape{crossSection},crossSectionShape{4})
    Title1 = 'I-beam Dimensions';
    prompt1 = {'Enter the base of the beam in inches.',['Enter the height ' ...
    'of the beam in inches.'],'Enter the thickness of the beam in inches.'};
    defaultAns1 = {'10','20','2'};
    Ibeam = inputdlg(prompt1,Title1,1,defaultAns1);
    b = str2double(Ibeam{1});
    h = str2double(Ibeam{2});
    t = str2double(Ibeam{3});
end

% Asks for the type of load (point or uniform)
loadType = {'Point','Uniform'};
Load = listdlg('PromptString','What type of load is it?','SelectionMode' ...
    ,'single','listString',loadType,'Name','Load type','ListSize',[400 400]);

% Asks for the weight of the load along with the the beam's length. It
% assigns values and turns the input from a character to a double precision
% value.
prompt2 = {'Enter magnitude of load (lbs)','Enter the length of the beam (inches)'};
promptTitle = 'Load information';
defaultAns2 = {'100','100'};
loadInfo = inputdlg(prompt2,promptTitle,1,defaultAns2);
F = str2double(loadInfo{1});
L = str2double(loadInfo{2});

% Asks for the type of beam support (cantilevered or simply supported)
BeamSupportType = {'Cantilevered','Simply Supported'};
BeamSupport = listdlg('PromptString','What type of beam support?', ...
    'SelectionMode' ...
    ,'single','listString',BeamSupportType,'Name','Beam Support Type',['' ...
    'ListSize'],[400 400]);

% Asks for the material of the beam.
materialType = {'Aluminum','Brass','Chromium','Copper','Iron',['Lea' ...
'd'],'Steel','Tin','Titanium','Zinc'};
userAns5 = listdlg('PromptString','What material is the beam made of?', ...
'SelectionMode','single','listString',materialType,'Name',['Material ' ...
'type'],'ListSize',[400 400]);
Material = materialType{userAns5};

% Asks for the distance that the load is away from the left end of the beam.
% This will affect the bending point and how far it bends. It also turns
% the user's input into a double precision value.
prompt3 = {'Enter location of load (inches from left end of beam)'};
promptTitle2 = 'Location of Load';
defaultAns3 = {'60'};
loadLocation = inputdlg(prompt3,promptTitle2,1,defaultAns3);
a = str2double(loadLocation{1});

% Assigns the variable to elasticity. This is assigned in a separate UDF
[E] = ModulusOfElasticity(Material);
% Calculates and assigns inertia to a variable. The inertia is calculated 
% in separate UDF
[I] = MomentOfInertia(b,h,t,crossSectionShape,crossSection);
% This is the UDF to calculate the deflection of the beam.
[x,y] = DeflectionCalculation(I,E,a,L,F,loadType,Load,BeamSupportType, ...
    BeamSupport);
% Plots the deflection
DeflectionPlot(x,y,BeamSupportType,BeamSupport,F,loadType, ...
    Load,Material,crossSectionShape,crossSection)


