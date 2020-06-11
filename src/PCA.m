Z=zscore(z)
function [t_all,t_pcs] = PLC(Z)
[Xrow, Xcol] = size(X);
Xc = mean(X);
Xe = std(X);
X0 = (X-ones(Xrow,1)*Xc) ./ (ones(Xrow,1)*Xe); 
sigma = cov(X0);
[V, D] = eig(sigma);
lmda = diag(D);
[Dt, index] = sort(lmda, 'descend');
npc = 1;
while sum(Dt(1:npc)) / sum(Dt) < 0.85
    npc = npc + 1;
end
P_all = V(:, index);
P_pcs = P_all(:, 1:npc);
Lambda = diag(Dt(1:npc));
t_all = X0 * P_all; 
t_pcs = t_all(:, 1:npc);
end
