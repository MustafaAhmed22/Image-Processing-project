function [ SegmentedSign ] = main_seeg( inputImage )
scaleDownFactor = 1 / 2;
scaleUpFactor = 2;
%scale road signs image down for fast and accurate performance of imfindcircles
roadSign = imresize(inputImage, scaleDownFactor);
%get input road signs image dimensions
[H W Z] = size(roadSign);
% figure, imshow(roadSign);

%find circle signs in the input road signs image
[centers, radii, metric] = imfindcircles(roadSign, [round(W * .01) round(W * .99)], ...
    'ObjectPolarity', 'dark');

%visual test
% viscircles(centers, radii,'EdgeColor','b');

%if circle signs were detected
if(~isempty(centers))
    %sign shape
    SignShape = 1;
    
    %calculate window size of sign
    SegmentedSign = imcrop(roadSign, [centers(1, 1) - radii(1) centers(1, 2) - radii(1) ...
        radii(1) * 2 radii(1) * 2]);
SegmentedSign = imresize(SegmentedSign, scaleUpFactor);

SegmentedSign = imresize(SegmentedSign,[100,100]);
    figure, imshow(SegmentedSign);
    
    

end

