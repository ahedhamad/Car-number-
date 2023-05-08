clc; % Clear command window
clear all; % Delete all variables.
close all; % Close all figure windows except those created by imtool.
imtool close all; % Close all figure windows created by imtool.
workspace; % Make sure the workspace panel is showing.

% Read Image
I = imread ('C:/Users/A-Z/Desktop/Project2/Car-number-/projectImage/Number Plate Images/image1.png');

% Show original image
figure(1);
imshow(I);

% Process image to extract car number
processHorizontal(I);

