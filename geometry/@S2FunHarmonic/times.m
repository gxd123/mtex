function sF = times(sF1,sF2)
% implements sF1 .* sF2
%
% Syntax
%  sF = sF1*sF2
%  sF = a*sF1
%  sF = sF1*a
%

if isnumeric(sF1) 
  sF = sF2;
  sF.fhat = sF.fhat*sF1;
elseif isnumeric(sF2)
  sF = sF1;
  sF.fhat = sF.fhat*sF2;
else
  f = @(v) sF1.eval(v) .* sF2.eval(v);
  sF = S2FunHarmonic.quadrature(f, 'bandwidth', sF1.bandwidth + sF2.bandwidth);
end

end
