function CCC0 = getCCC0(SNP,q)

[N, ~] = size(SNP);
SNP1 = SNP(:,1:2);
SNP2 = SNP(:,3:4);

R1 = zeros(N,2);
R2 = zeros(N,2);
for i = 1:N
	if SNP1(i,1) == 1
        if SNP1(i,2) == 1
            R1(i,1) = 0;
            R1(i,2) = 1;
        else
            R1(i,1) = .5;
            R1(i,2) = .5;
        end
    else
        if SNP1(i,2) == 1
            R1(i,1) = .5;
            R1(i,2) = .5;
        else
            R1(i,1) = 1;
            R1(i,2) = 0;
        end
    end
    if SNP2(i,1) == 1
        if SNP2(i,2) == 1
            R2(i,1) = 0;
            R2(i,2) = 1;
        else
            R2(i,1) = .5;
            R2(i,2) = .5;
        end
    else
        if SNP2(i,2) == 1
            R2(i,1) = .5;
            R2(i,2) = .5;
        else
            R2(i,1) = 1;
            R2(i,2) = 0;
        end
    end
end

R = transpose(R1) * R2 / N;

F = zeros(2,2);
for i = 1:N
    for j = 1:2
        if SNP1(i,j) == 0
            F(1,1) = F(1,1) + 1;
        else
            F(1,2) = F(1,2) + 1;
        end
        if SNP2(i,j) == 0
            F(2,1) = F(2,1) + 1;
        else
            F(2,2) = F(2,2) + 1;
        end
    end
end
if nargin < 2
    q = 1.5;
end
F = 1 - F / 2 / N / q;

CCC = zeros(2,2);
for i = 1:2
    for j = 1:2
        CCC(i,j) = 9 / 2 * R(i,j) * F(1,i) * F(2,j);
    end
end

CCC1 = transpose(R1(:,1)) * R1(:,2) / N * 9 / 2 * F(1,1) * F(1,2);
CCC2 = transpose(R2(:,1)) * R2(:,2) / N * 9 / 2 * F(2,1) * F(2,2);
CCC0 = [CCC(1,1) CCC(1,2) CCC(2,1) CCC(2,2) CCC1 CCC2];

end
