% 1. Example Implement a discrete fuzzy function in Matlab
AX = 0:9;
muA = [0.2 0.5 1 0.8 0.7 0.6 0.5 0.4 0.3 0.2];

BX = 0:9;
muB = [0.3 0.4 0.5 0.8 1 0.7 0.6 0.5 0.4 0.3];

CX = 0:9;
muC = zeros(size(CX));

for x=CX
    i = find(CX==x);
    for x1=AX
        j = find(AX==x1);
        for x2=BX
            k = find(BX==x2);            
            if(x1+x2==x)
                muC(i) = muC(i) + muA(j)*muB(k);
            end               
        end
    end
end

muC = muC / max(muC);

figure;

subplot(3,1,1);
stem(AX, muA)
title('FUZZY SET A')

subplot(3,1,2)
stem(BX, muB)
title('FUZZY SET B')

subplot(3,1,3)
stem(CX, muC)
title("FUZZY SET (A+B)")
