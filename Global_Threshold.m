function [segmentedimage] = Global_Threshold(I_filepath)
%1) Read Image
image = imread(I_filepath);
subplot(2,2,1); imshow(image); title('Original Image');

%2) Convert loaded image to grayscale image
grayimage = rgb2gray(image);
subplot(2,2,2); imshow(grayimage); title('Grayscale Image');

%3) Display Histogram
hold on;
subplot(2,2,3); imhist(grayimage); title('Histogram');

%4) Compute Global Threshold (t) in range [0,1]
t = graythresh(grayimage);
%Draw threshold line
line([t*255,t*255],[0,5000],'Color','r','LineWidth',3);
hold off;

%5) Convert Image to binary image based on t
% pixel > t*255 --> 1 (white)
% Otherwise --> 0 (black)
segmentedimage = im2bw(grayimage,t);
subplot(2,2,4); imshow(segmentedimage); title(['Segmented Image, t= ', num2str(t*255)]);
end

