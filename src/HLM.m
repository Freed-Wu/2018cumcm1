for i=1:5
   m=xlsread('problem2.xlsx')
   x=m(1:6,1:5);
   y=m(:,5+i)
   x=[ones(6,1) x];
   [b(i),bint(i),r(i),rint(i),stats(i)] = regress(y,X);
end
