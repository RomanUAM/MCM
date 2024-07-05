function [S]=Vector_that_offered_the_best_solution(A5,n)
[a1 a2]=min(A5(:,n+1));
S(1,:)=A5(a2,:);