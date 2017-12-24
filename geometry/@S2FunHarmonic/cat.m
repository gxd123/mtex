function sF = cat(dim,varargin)
% 

% remove emtpy arguments
varargin(cellfun('isempty',varargin)) = [];
sF = varargin{1};
bw = sF.bandwidth;

for i = 2:numel(varargin)

  bw2 = varargin{i}.bandwidth;
  if bw > bw2
    varargin{i}.bandwidth = bw;
  else
    sF.bandwidth = bw2;
end

  sF.fhat = cat(1+dim, sF.fhat, varargin{i}.fhat);
end
