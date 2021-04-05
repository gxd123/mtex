function [v,varargout] = volume(SO3F,center,radius,varargin)

% for large angles or specimen symmetry take the quadrature based algorithm
if radius > pi / SO3F.CS.multiplicityZ || ...
    length(SO3F(1).SS) > 1
  
  [v,varargout{1:nargout-1}] = volume@SO3Fun(SO3F,center,radius,varargin{:});
  
else

  % compute distances
  d = reshape(SO3F.center.angle_outer(center,'all'), length(SO3F.center),[]).';
  
  % precompute volumes
  [vol,r] = volume(SO3F.psi,radius);
  
  % interpolate
  v = interp1(r,vol,d.','spline');
  
  % sum up
  v = sum(v.' * SO3F.weights(:));
  
  % add uniform portion
  v = v + SO3F.c0 * numProper(SO3F.CS) * (radius - sin(radius))./pi;
 
  varargout = varargin;
  
end