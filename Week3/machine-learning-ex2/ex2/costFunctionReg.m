function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = size(X)(2); % number of features of X

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X*theta);
J_train = (1/m)*(-y'*log(h) - (1-y)'*log(1-h));
J_reg   = (lambda/(2*m)).*(theta(2:n)'*theta(2:n));
J = J_train + J_reg;

grad(1) = (1/m).*(X(:,1)'*(sigmoid(X*theta)-y));

grad_reg = (lambda/m).*theta(2:n);
grad_train = (1/m).*(X(:,2:n)'*(sigmoid(X*theta)-y)) ;
grad(2:n) = grad_train + grad_reg;



% =============================================================

end
