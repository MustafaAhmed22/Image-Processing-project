function [  fiture1, fiture2, fiture3 ] = reco(  )
input_directory = 'E:\final_year\matlab_path\milston2\image_Project\train'; %e.g. 'D:\faces'

filenames = dir(fullfile(input_directory, '*.jpg'));
num_images = length(filenames);
for i = 1:num_images
    %Build File Name 
    filename = fullfile(input_directory, filenames(i).name);
    image = imread (filename) ;
    image = imresize(image,[96,96]);
    [f1,f2,f3]=train(image);
if(i==1)
    fiture1=f1;
    fiture2=f2;
    fiture3=f3;
    else
fiture1=[fiture1;f1];
fiture2=[fiture2;f2];
fiture3=[fiture3;f3];
    end
end

end

