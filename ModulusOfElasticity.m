% Modulus of Elasticity (Braeden)

% The function used to determine the elasticity of the beam based on 
% the material
function [E] = ModulusOfElasticity(Material)

% A switch case is used so for whatever option the user chooses from gets
% assigned a Modulus of Elasticity
switch Material

    case 'Aluminum'
        E = 10.0*(10^6);
        
    case 'Brass'
        E = 15.9*(10^6);
    
    case 'Chromium'
        E = 36.0*(10^6);

    case 'Copper'
        E = 15.6*(10^6);

    case 'Iron'
        E = 28.5*(10^6);

    case 'Lead'
        E = 2.6*(10^6);

    case 'Steel'
        E = 30.0*(10^6);

    case 'Tin'
        E = 6.0*(10^6);

    case 'Titanium'
        E = 16.8*(10^6);

    case 'Zinc'
        E = 12.0*(10^6);

end




