function [ img2,counte2 ] = find_red( image )

[H1 W1 L] = size(image);
counte2 =0;
img2 = uint8(zeros(H1,W1,L));
imm2 = rgb2gray(image);
inn = medfilt2(imm2); 
imshow (inn);
if (H1 == 0|| W1 ==0)
    img2 = 0;
end

for i = 1:H1
    for j = 1:W1
        
if(image(i,j,1) >= 120 && image(i,j,2) <= 70 && image(i,j,3) <= 70)

    img2(i,j,:) = image(i,j,:);
    counte2 =counte2+1 ;
end

if(image(i,j,1) >= 140 && image(i,j,2) <= 100 && image(i,j,3) <= 105)

    img2(i,j,:) = image(i,j,:);
    counte2 =counte2 +1 ;
end


    end
    
end

imu = im2bw(img2);
coun = sum(sum(imu));

for i = 1 :H1
    for j = 1  : W1
        
        if (img2(i,j,1) ~= 0 ||img2(i,j,2) ~= 0 || img2(i,j,3) ~= 0)
            img2 (i,j , 2) = 254;
            img2 (i,j , 1) = 0;
            img2 (i,j , 3) = 0;
          
        end
    end
end

 img2 = im2bw (img2);
figure , imshow (img2) ;

end