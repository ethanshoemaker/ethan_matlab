function properties = h2Oprops(temp,property,unit_system)

%checks which unit system to use
if strcmpi(unit_system, 'SI')
    %determines which property to return in SI
    if strcmpi(property,'rho')
        properties = h2Orho_SI(temp);
    elseif strcmpi(property,'mu')
        properties = h2O_mu_SI(temp);
    elseif strcmpi(property,'nu')
        properties = h2O_nu_SI(temp);
    elseif strcmpi(property,'pv')
        properties = h2O_pv_SI(temp);
    else
        disp('error')
    end
elseif strcmpi(unit_system,'BG')
    %determines which property to return in BG
    if strcmpi(property,'rho')
        properties = h2Orho_BG(temp);
    elseif strcmpi(property,'mu')
        properties = h2O_mu_BG(temp);
    elseif strcmpi(property,'nu')
        properties = h2O_nu_BG(temp);
    elseif strcmpi(property,'pv')
        properties = h2O_pv_BG(temp);
    else
        disp('error')
    end
else
    disp('error')
end
