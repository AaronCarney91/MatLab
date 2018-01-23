function [x] = stage2(U, y)
%Solve x using backwords substitution

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
end
