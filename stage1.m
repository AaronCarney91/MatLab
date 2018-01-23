function [y] = stage1(L, b)
%Solve y using forword substitution

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
end
