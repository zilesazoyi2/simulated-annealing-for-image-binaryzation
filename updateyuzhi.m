function newyuzhi = updateyuzhi( yuzhi )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    %   change=  -10+10*rand();
       
           change= -5+randi(10);
       
   
       if change==0
           
          % change=change-11+10*rand();
          
              change= -11+randi(10);
           
             newyuzhi =yuzhi+ceil(change);
       
       if   newyuzhi >256
           
           newyuzhi=256;
       end
       
       if  newyuzhi<1
           
           newyuzhi=1;
       end 
           
           
         
           
       else
       
       newyuzhi =yuzhi+ceil(change);
       
       if   newyuzhi >256
           
           newyuzhi=256;
       end
       
       if  newyuzhi<1
           
           newyuzhi=1;
       end 

    
       end 
       
       
       
       
end

