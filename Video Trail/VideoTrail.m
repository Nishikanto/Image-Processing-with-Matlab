
%%
% 
%  Nishikanto Sarkar
%  Reg No. 2012331071
% 
%% Trailing Object From a Video

%% 
% Graphical layout for choosing a video file from storage
[filename, pathname] = uigetfile('*.mp4', 'Select Video file');

%% 
% Spliting Frame and saveing it to specific path one by one. 
if isequal(filename,0)
   disp('User selected Cancel')
else
   disp(['User selected ', fullfile(pathname, filename)])
   v = VideoReader(fullfile(pathname, filename));
   
   % In this loop all frame 1st converted to a gray scale image then
   % converted to binary image and then add to the previous binary image.
   for img = 1:v.NumberOfFrames;
       b = read(v,  img);
       I = rgb2gray(b);
       if(img == 1)
           level = graythresh(I);  %# Compute an appropriate threshold
            bw = im2bw(I,level);    %# Convert grayscale to binary
       end
       if(img>1)
           bw = bw + im2bw(I,level);
       end
   end
   
   % Print the Path. 
   imshow(bw);
  
end

%% Importance
% This is important for tracking a moving object and get his path. 

