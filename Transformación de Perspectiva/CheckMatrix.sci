function CheckMatrix(Input, Name)
//////////////////////////////////////////////////////////////////////////// 
// IPD - Image Processing Design Toolbox
//
// Copyright (c) by Dr. Eng. (J) Harald Galda, 2009 - 2011
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
////////////////////////////////////////////////////////////////////////////

 global TYPE_INT;

 global TYPE_DOUBLE;

 global TYPE_BOOLEAN;

 if length(size(Input)) ~= 2 then
  
  error('Parameter ''' + Name + ''' must be a 2D matrix.');
  
 end;

 DataType = type(Input);
 
 if (DataType ~= TYPE_DOUBLE) & (DataType ~= TYPE_INT) & (DataType ~= TYPE_BOOLEAN)
 
  error('Parameter ' + Name + ' must be numeric or boolean.');
    
 end;
  
endfunction

