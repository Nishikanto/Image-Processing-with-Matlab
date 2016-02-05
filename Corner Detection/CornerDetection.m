
%%
% 
%  Nishikanto Sarkar
%  Reg No. 2012331071
% 
%% Corner Detection
% Find Corners in Images. 

%% 
% Create a checkerboard image.
I = checkerboard(40,2,2);

%% 
% Find the corners in the image.
% The corner function identifies corners in an image. Two methods are 
% available—the Harris corner detection method (the default) 
% and Shi and Tomasi's minimum eigenvalue method
C = corner(I, 'MinimumEigenvalue');

%% subplot(1,2,1);
% imshow(I);
% hold on
% plot(C(:,1), C(:,2), '*', 'Color', 'c')
% title('Maximum Corners = 200')
% hold off

% Display the corners when the maximum number of desired corners is 
% the default setting of 200.

height = size(C,1);
width = size(C,2);

disp(height);
disp(width);

for i = 1:height
for j = 1:width
    disp(C(i,1));
end;
end;

%% Imaportance
% To find correspondence between images we can use corners. 


