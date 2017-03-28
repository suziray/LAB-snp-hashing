load('result');
[s,~] = size(number);

minNum = 5000;
SNP = [];
N = 1000;


for i = 1:s
    if number(i,1) > minNum
        SNP = [SNP randSNPGenerator(N,1-uniqueC(i,1))];
    end
end

[~,s] = size(SNP);
s = s/2;
CCCs = [];

for i = 1:s-1
    disp(i);
    for j = i+1:s
        SNP1 = SNP(:,2*i-1:2*i);
        SNP2 = SNP(:,2*j-1:2*j);
        CCCs = [CCCs getCCC([SNP1 SNP2])];
    end
end

