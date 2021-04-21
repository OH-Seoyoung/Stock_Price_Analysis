function y=deri(matrix)

row = size(matrix,1);
y =  (matrix(2:1:row,:) - matrix(1:1:row-1,:))./matrix(1:1:row-1,:);