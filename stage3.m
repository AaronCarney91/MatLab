function [L U] = stage3(A)
%Takes A and calculates a Lower and Upper Trianguler Matrix using L U Factorisation, where LU=A
   
	%Take the size of A.
	[r,c] = size(A);
   
	%ERROR HANDLING
	%If A's number of rows and columns are unequal, the matrix is not squere.
	if r ~= c
		error('"A" must be a squere matrix');
	end
	
	%If Matrix pass is filled with zeros
	if sum(A) == 0
		error('"A" cannot be filled with zeros');
	end
	
	%A cannot be empty
	if isempty(A)
		error('Parameters cannot be empty');
	end
	%END OF ERROR HANDLING
   
	%Create two Matrices that are the same size as A.
	U = zeros(r,c);
	L = zeros(r,c);
   
	%Row 1 of U.
	%The 1st row of U is the same as the 1st row of A, as they will all be multiplied by 1.
	%1st element of L will be 1
	U(1,:) = A(1,:);
   
	%Column 1 of L
	%The 1st column of L is the 1st column of A devided by the 1st element of U
	L(:,1) = A(:,1) / U(1,1);
   
	%Remaining rows and columns of L and U
	%Solves the 2nd row of U, then the 2nd column of L, nth row of U, nth column of L, etc.
	for i = 2:r
    
		%begining 'i' and 'n' at 2 is so zeros are left above or below the diaganols.
		for n = i:r
		U(i,n) = A(i,n) - (L(i,:) * U(:,n));
		end
	   
		%The above formula does not include the devide by section at the end because
		%L has ones along the diaganol, deviding by 1 is unnecessary when solving the values of U
		for n = i:c
		L(n,i) = (A(n,i) - (L(n,:) * U(:,i))) / U(i,i);
		end
      
	end
   

end
   

   
   
   
    