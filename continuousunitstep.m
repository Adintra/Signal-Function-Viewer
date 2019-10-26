function [t, u] = continuousunitstep(varargin)
%CONTINUOUSUNITSTEP Creates a unit step function with various parameters.
%   Creates a continuous time unit step function U of variable t. Both t
%   and u have product, division, and summation variables for operations on
%   the unit step function output.

% Function default arguments.
if sum(strcmp('tProd', varargin))
    tProd = varargin{find(strcmp('tProd', varargin)) + 1};
else
    tProd = 1;
end

if sum(strcmp('tAdd', varargin))
    tAdd = varargin{find(strcmp('tAdd', varargin)) + 1};
else
    tAdd = 0;
end

if sum(strcmp('uProd', varargin))
    uProd = varargin{find(strcmp('uProd', varargin)) + 1};
else
    uProd = 1;
end

if sum(strcmp('uAdd', varargin))
    uAdd = varargin{find(strcmp('uAdd', varargin)) + 1};
else
    uAdd = 0;
end

% Continuous time unit step creation.
t1 = ((linspace(-20, 0, 100).*tProd) - tAdd);
t2 = ((linspace(0, 20, 200).*tProd) - tAdd);
t = [t1 t2];

u1 = zeros(size(t1));
u2 = ones(size(t2));
utemp = [u1 u2];
u = (utemp.*uProd) + uAdd;
end
