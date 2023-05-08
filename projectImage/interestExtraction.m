function interestExtraction(img , row_size,column_size, max_horz, max_vert, column, row)
    %% Region of Interest Extraction
    %Check each probable candidate
    for i = 1:2:row_size
        for j = 1:2:column_size
            % If it is not the most probable region remove it from image
            if(~((max_horz >= column(j) && max_horz <= column(j+1)) && (max_vert >=row(i) && max_vert <= row(i+1))))
                %This loop is only for displaying proper output to Use
                for m = row(i):row(i+1)
                    for n = column(j):column(j+1)
                        img(m, n) = 0;
                    end
                end
            end
        end
    end
    figure(8), imshow(img);
    
    % Call plateRecognition function with the extracted region of interest
    plateRecognition(img);
end
