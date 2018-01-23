function [x] = stage4(A,b)

	%PART 1, L U FACTORISATION.
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
	%END OF PART 1
	
	%PART 2 DETERMINANTS
	%Determinant of U and L, The factor of the diaganol elements.
	dU = U(1,1);
	dL = L(1,1);
	for n = 2:r
	dU = dU * U(n,n);
	dL = dL * L(n,n);
	end
	
	%Determinant is determinant of U multiplied by determinant of L.
	d = dU * dL;
	%END OF PART 2
	
	%PART3 FORWORD AND BACKWORD SUBSTITUTION
	%If determinant is zero, No solution exists
	if d == 0
		disp('No Solution exists');
	else
		%PART 3.1 FORWORD SUBSTITUTION
		%Takes the row and column size of 'b' and 'L'.
		[r,c] = size(b);
		[lr,lc] = size(L);
		
		%ERROR HANDLING
		%If L's number of rows and columns are unequal, the matrix is not squere.
		if lr ~= lc
			error('"L" must be a squere matrix');
		end
		
		%L or b cannot be empty
		if isempty(b) || isempty(L)
			error('Parameters cannot be empty');
		end
		
		%If 'b' has more than 1 column, then it is not a appropriate vector(Verticle and of right size)
		if c > 1
			error('"b" must be a appropriate vector');
		end
		
		%If vector is not the same size as the matrix
		if r ~= lr
			error('Vector and Matrix are not of equal size');
		end
		
		%L or b cannot be full of zeros
		if sum(b) == 0 || sum(L) == 0
			error('Parameters cannot be made of zeros');
		end
		%END OF ERROR HANDLING
		
		%Creates a vector of the same size as 'b' called 'y'
		y = zeros(r,c);

		%1st element of y is always the same as the 1st element of b,
		%as its always multiplied by one (1st element of L is 1).
		y(1) = b(1);

		%Solve remaining y values, nth row of L multiplied by y, 
		%subtracted from nth element of b.
		for n = 2:r
		y(n) = b(n) - (L(n,:)*y);
		end
		%END OF PART 3.1

		%PART 3.2, BACKWORD SUBSTITUTION
		%Takes the row and column size of 'y' and 'U'.
		[r,c] = size(y);
		[ur,uc] = size(U);
		
		%ERROR HANDLING
		%If U's number of rows and columns are unequal, the matrix is not squere.
		if ur ~= uc
			error('U must be a squere matrix');
		end
		
		%U or y cannot be empty
		if isempty(y) || isempty(U)
			error('Parameters cannot be empty');
		end
			
		%If 'y' has more than 1 column, then it is not a vector
		if c > 1
			error('"y" must be a appropriate vector');
		end
		
		%If vector is not the same size as the matrix
		if r ~= ur
			error('Vector and Matrix are not of equal size');
		end
		
		%L or b cannot be full of zeros
		if sum(y) == 0 || sum(U) == 0
			error('Parameters cannot be made of zeros');
		end
		%END OF ERROR HANDLING
		
		%Creates a vector of the same size as 'y' called 'x'
		x = zeros(r,c);

		%Find the last value of x 1st, before working back from there.
		%The last emelemnt of x is the last element of y devided by the last element of U
		x(r) = y(r) / U(r,r);
		
		%Loop iterating backwords.
		%The nth element of x is the nth element of y minus the nth row of U multiplied by x
		%The nth value of y takeaway the nth row of U multiplied by x, 
		%devided by the nth diaganol element of U
		for n = r-1:-1:1
		x(n)=(y(n)-(U(n,:)*x))/U(n,n);
		end
		%END OF PART 3.2
   
	

end
	
   