% Bastien Milani
% CHUV and UNIL
% Lausanne - Switzerland
% May 2023

function s = bmConv2(f, h, dx, dy)

n_u = size(f); 
s = zeros(n_u);

Nx = n_u(1, 1); 
Ny = n_u(1, 2); 

dR = dx*dy; 


for nx = -Nx/2:Nx/2-1    
    for ny = -Ny/2:Ny/2-1
        
        temp_sum = 0;
        
        for px = -Nx/2:Nx/2-1
            
            ind_2_x = px + Nx/2 + 1;
            ind_3_x = private_mod(nx-px, Nx) + Nx/2 + 1;
            
            for py = -Ny/2:Ny/2-1
                
                ind_2_y = py + Ny/2 + 1;
                ind_3_y = private_mod(ny-py, Ny) + Ny/2 + 1;
                
                temp_sum = temp_sum + dR*f(ind_2_x, ind_2_y)*h(ind_3_x, ind_3_y); 
                
            end
            
        end
        
        s(nx + Nx/2 + 1, ny + Ny/2 + 1) = temp_sum;
        
    end
end

end


function myMod = private_mod(n, N)
    myMod = mod(n + N/2, N) - N/2; 
end