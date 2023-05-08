function processVertical(I,rows,cols, horz, max_horz)
%% PROCESS EDGES IN VERTICAL DIRECTION
difference = 0;
total_sum = 0;
difference = uint32(difference);
disp('Processing Edges Vertically...');
maximum = 0;
max_vert = 0;
vert1 = zeros(rows,1); % initialize vert1
for i = 2:rows
    sum = 0;
    for j = 2:cols %cols
        if(I(i, j) > I(i, j-1))
            difference = uint32(I(i, j) - I(i, j-1));
        else
            difference = uint32(I(i, j-1) - I(i, j));
        end
        if(difference > 20)
            sum = sum + difference;
        end
    end
    vert1(i) = sum;
    %% Find Peak in Vertical Histogram
    if(sum > maximum)
        max_vert = i;
        maximum = sum;
    end
    total_sum = total_sum + sum;
end
average = total_sum / rows;
figure(6)
subplot(3,1,1);
plot (vert1);
title('Vertical Edge Processing Histogram');
xlabel('Row Number ->');
ylabel('Difference ->');
%% Smoothen the Vertical Histogram by applying Low Pass Filter
disp('Passing Vertical Histogram through Low Pass Filter...');
sum = 0;
vert = vert1;
for i = 21:(rows-21)
    sum = 0;
    for j = (i-20):(i+20)
        sum = sum + vert1(j);
    end
    vert(i) = sum / 41;
end
subplot(3,1,2);
plot (vert);
title('Histogram after passing through Low Pass Filter');
xlabel('Row Number ->');
ylabel('Difference ->');
%% Filter out Vertical Histogram Values by applying Dynamic Threshold
disp('Filtering out Vertical Histogram...');
for i = 1:rows
    if(vert(i) < average)
        vert(i) = 0;
        for j = 1:cols
            I(i, j) = 0;
        end
    end
end
subplot(3,1,3);
plot (vert);
title('Histogram after Filtering');
xlabel('Row Number ->');
ylabel('Difference ->');
figure(7), imshow(I);

candidatesNumber(I, rows,cols,horz, vert , max_horz , max_vert)
