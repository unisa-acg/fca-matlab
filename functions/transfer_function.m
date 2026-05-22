function [G] = transfer_function(A,B,C,D)
%TRANSFER_FUNCTION Computes the Laplace Transfer Function of the
%state-space system described by the dynamic matrices A,B,C,D
%   The function implements the equation G(s) = C (sI-A)^-1 B + D, such
%   that the response is Y(s) = G(s) U(s), where U(s) is the Laplace
%   transform of an input
syms s
I = eye(size(A));
G(s) = C / (s*I - A) * B + D;
end
