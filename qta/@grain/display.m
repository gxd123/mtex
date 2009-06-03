function display(grains)
% standart output

disp(' ')
str = [inputname(1),' = grain data '];
disp(str);
disp(repmat('-', size(str)))
if ~isempty(grains) 
  checksums = dec2hex(unique([grains.checksum]));  
  checksums = strcat(' grain_id', cellstr(checksums) ,',');
  disp([ checksums{:}])
end
if ~isempty(fields(grains(1).properties))
  disp([' properties: ',option2str(fields(grains(1).properties))]);
end
disp([' size: ' num2str(size(grains,1)) ' x ' num2str(size(grains,2))])
