%==========================================================================
%
% line_intersection  Finds the intersection of two lines.
%
%   [x_int,y_int] = line_intersection(line1,line2)
%
% See also polyxpoly.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-09-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Intersection_of_Two_Lines.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   line1   - (1×1, 1×2, 1×3, or 1x4 double) parameters defining line 1:
%               --> x1: vertical line form (x-intercept of vertical line)
%               --> [m1,b1]: slope-intercept form
%               --> [x1,y1,m1]: point-slope form
%               --> [x1,y1,x2,y2]: two point form
%   line2   - (1×1, 1×2, 1×3, or 1x4 double) parameters defining line 2:
%               --> x2: vertical line form (x-intercept of vertical line)
%               --> [m2,b2]: slope-intercept form
%               --> [x2,y2,m2]: point-slope form
%               --> [x3,y3,x4,y4]: two point form
%
% -------
% OUTPUT:
% -------
%   x_int   - (1×1 double) x-coordinate of intersection of the two lines
%   y_int   - (1×1 double) y-coordinate of intersection of the two lines
%
% -----
% NOTE:
% -----
%   --> vertical line form: x = x0
%   --> slope-intercept form: y = mx + b
%   --> point-slope form: y - y0 = m(x - x0)
%   --> two point form: (x1,y1) and (x2,y2) are two points on the line
%
% -----------
% EDGE CASES:
% -----------
%   --> Vertical lines can be defined using the vertical line form or the 
%       two point form.
%   --> If the two lines are parallel (but not collinear), the function 
%       returns positive or negative infinity for the coordinates of the 
%       intersection, and a warning is displayed.
%   --> If the two lines are collinear (but not vertical), the function 
%       returns "[NaN,NaN]" and displays a warning.
%   --> If the two lines are vertical and collinear, the function returns
%       the x-coordinate of the line for the x-coordinate of the 
%       intersection, and "NaN" for the y-coordinate of the intersection.
%
%==========================================================================
function [x_int,y_int] = line_intersection(line1,line2)

    % determines point and slope for both lines
    [x1,y1,m1] = get_point_slope(line1);
    [x2,y2,m2] = get_point_slope(line2);
    
    % both lines vertical
    if (abs(m1) == Inf) && (abs(m2) == Inf)
        if x1 == x2
            x_int = x1;
            y_int = NaN;
            warning('The two lines are collinear.');
        else
            x_int = Inf;
            y_int = Inf;
        end
        
    % line 1 vertical
    elseif abs(m1) == Inf
        x_int = x1;
        y_int = y2+m2*(x_int-x2);
        
    % line 2 vertical
    elseif abs(m2) == Inf
        x_int = x2;
        y_int = y1+m1*(x_int-x1);
        
    % neither line vertical
    else
        x_int = ((m1*x1-m2*x2)-(y1-y2))/(m1-m2);
        y_int = m1*(x_int-x1)+y1;
    end
    
    % displays warning if two (non-vertical) lines are collinear (results
    % in (x,y) = (NaN,NaN))
    if isnan(x_int) && isnan(y_int)
        warning('The two lines are collinear.');
    end
    
    % displays warning if the two lines are parallel (results in x = ±∞)
    if abs(x_int) == Inf
        warning('The two lines are parallel.')
    end
    
    %======================================================================
    % get_point_slope  Given an input line of any form, determines its 
    % point-slope form.
    %----------------------------------------------------------------------
    %
    % ------
    % INPUT:
    % ------
    %   line    - (1×1, 1×2, 1×3, or 1x4 double) params defining line 1:
    %               --> x0: vertical line form (x-intercept of vertical
    %                      line)
    %               --> [m,b]: slope-intercept form
    %               --> [x0,y0,m]: point-slope form
    %               --> [x1,y1,x2,y2]: two point form
    %
    % -------
    % OUTPUT:
    % -------
    %   x       - (1×1 double) x-coordinate of point on line
    %   y       - (1×1 double) y-coordinate of point on line
    %   m       - (1×1 double) slope of line
    %
    % -----
    % NOTE:
    % -----
    %   --> If line is vertical, the function returns [x,NaN,Inf], where 
    %       "x" is the x-intercept of the vertical line.
    %
    %======================================================================
    function [x,y,m] = get_point_slope(line)
        
        % input given in vertical line form
        if length(line) == 1
            x = line(1);
            y = NaN;
            m = Inf;
        
        % input given in slope-intercept form
        elseif length(line) == 2
            x = 0;          % x-coordinate of the y-intercept
            y = line(2);    % y-coordinate of the y-intercept
            m = line(1);
        
        % input given in point-slope form
        elseif length(line) == 3
            x = line(1);
            y = line(2);
            m = line(3);
            
        % input given in two point form
        else
            m = (line(4)-line(2))/(line(3)-line(1));
            if abs(m) == Inf
                x = line(1);    % x-intercept of vertical line
                y = NaN;
                m = Inf;
            else
                x = line(1);    % x-coordinate of first point
                y = line(2);    % y-coordinate of first point
            end
        end
        
    end
    
end