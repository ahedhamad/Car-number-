function candidatesNumber(img, rows,cols,horz, vert , max_horz , max_vert)
%% Find Probable candidates for Number Plate
        j = 1;
        for i = 2:cols-2
        if(horz(i) ~= 0 && horz(i-1) == 0 && horz(i+1) == 0)
        column(j) = i;
        column(j+1) = i;
        j = j + 2;
        elseif((horz(i) ~= 0 && horz(i-1) == 0) || (horz(i) ~= 0 && horz(i+1) == 0))
        column(j) = i;
        j = j+1;
        end
        end
        j = 1;
        for i = 2:rows-2
        if(vert(i) ~= 0 && vert(i-1) == 0 && vert(i+1) == 0)
        row(j) = i;
        row(j+1) = i;
        j = j + 2;
        elseif((vert(i) ~= 0 && vert(i-1) == 0) || (vert(i) ~= 0 && vert(i+1) == 0))
        row(j) = i;
        j = j+1;
        end
        end
        [temp column_size] = size (column);
        if(mod(column_size, 2))
        column(column_size+1) = cols;
        end
        [temp row_size] = size (row);
        if(mod(row_size, 2))
        row(row_size+1) = rows;
        end
interestExtraction(img,row_size,column_size, max_horz, max_vert, column, row)