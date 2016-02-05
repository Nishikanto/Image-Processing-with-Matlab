
%%
% 
%  Nishikanto Sarkar
%  Reg No. 2012331071
% 
%% VideoToFrame
% Extracting all frame from selected video. 

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
   folder = 'F:\Matlab\Assignment-4\images';

   for img = 1:v.NumberOfFrames;
       fileName = strcat('Frame', num2str(img), '.jpg');
       b = read(v,  img);
       imwrite(b, fullfile(folder,fileName));
   end
       
end

%% Importance
% For Video processing we need all the frame that a video has. 

