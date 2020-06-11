R=zscore(R)
function weights = EntropyWeight(R)
[rows,cols]=size(R);
k=1/log(rows);
f=zeros(rows,cols);
sumBycols=sum(R,1);
for i=1:rows
    for j=1:cols
        f(i,j)=R(i,j)./sumBycols(1,j);
    end
end
lnfij=zeros(rows,cols);
for i=1:rows
    for j=1:cols
        if f(i,j)==0
            lnfij(i,j)=0;
        else
            lnfij(i,j)=log(f(i,j));
        end
    end
end
Hj=-k*(sum(f.*lnfij,1));
weights=(1-Hj)/(cols-sum(Hj));
end
