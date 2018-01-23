% here are some LU factorised matrices that you can use for 
% stage4 if you are struggling to get stage3 working. this file will
% generate two LU factorised matrices one is a 3x3 and the other a 4x4.
% Both are full rank.  You can generate any 3x1 and 4x1 right hand side
% vector b to go with these. If you haves stuggled to get stage 3 working
% then you can use these in stage 4 as x = stage4(L,U,b) instead of 
% x = stage4(A,b)

L = [1 0 0; -2 1 0; 1 -3 1]

U = [ 1 2 3;0 3 2;0 0 4]

A = L*U

L1 = [1 0 0 0;3 1 0 0; -3 2 1 0; 3 2 2 1]

U1 = [4 1 -2 3; 0 1 1 2; 0 0 3 2;0 0 0 2]

A1 = L1*U1 