% 2. Example  Implement a Continuous Fuzzy Function in Matlab
n =500;

AX = linspace(0, 12, n);
muA = @(x) trimf(x, [0 2 6]);

BX = linspace(0, 12, n);
muB = @(x) trapmf(x, [3 5 8 12]); 

CX = linspace(0, 12, n);
muC = zeros(size(CX));

for x=CX
    i = find(CX==x);
    for x1=AX
        x2 = x - x1;
        muC(i) = muC(i) + muA(x1)*muB(x2);
    end
end

muC = muC / max(muC);

figure;

subplot(3,1,1);
stem(AX, muA(AX))
title('FUZZY SET A (Triangular membership function)')

subplot(3,1,2)
stem(BX, muB(BX))
title('FUZZY SET B (Trapezoidal membership function')

subplot(3,1,3)
stem(CX, muC)
title("FUZZY SET (A+B)")
