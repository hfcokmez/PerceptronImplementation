function [finalweight] = Algorithm(init,samples,rho)
wrongClassified=true;
finalweight=init;

while wrongClassified
    x1=finalweight(1,1);
    x2=finalweight(2,1);
    x3=finalweight(3,1);
    
%Sample de�erlerini g�ncelleme  
    
    for i=1:size(samples,2)
        if(x1*samples(1,i) + x2*samples(2,i) + x3 > 0 )
            samples(3,i)=1;
        elseif(x1*samples(1,i) + x2*samples(2,i) + x3 < 0 ) 
            samples(3,i)=-1;
        end
    end
    
%Yeni vekt�r �izimi
    
    for i=1:size(samples,2)
        if(samples(3,i)==1 && i<=100 )
            tempWrong(1:2,1)=samples(1:2,i);
            tempWrong(3,1)=1;
            finalweight=finalweight -(rho*tempWrong);
        elseif(samples(3,i)==-1 && i>100)
            tempWrong(1:2,1)=samples(1:2,i);
            tempWrong(3,1)=1;
            finalweight=finalweight +(rho*tempWrong);
        end
    end
    
%De�erlik kontrol� ile while d�ng�s�nden ��k�� (T�m Class 1'deki �rnekler -1 ve class 2'dekiler 1 ise ��k�l�r)
    
    truthcontrol=0;
    for i=1:size(samples,2)
        if(samples(3,i)==-1 && i<=100)
            truthcontrol=truthcontrol+1;
        elseif(samples(3,i)==1 && i>100)
            truthcontrol=truthcontrol+1;
        end   
        if truthcontrol==200
            wrongClassified=false;
        end
    end    
end     
end

