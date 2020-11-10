function [SEG ] = main_seg( image )

[H2 W2] = size(image);

lap=[1 ,1 ,1 ; 1, -8, 1; 1, 1, 1];
gr = rgb2gray (image);
soso=medfilt2(gr);
mat=imfilter(soso,lap);
%imshow(mat);
size_mul = H2*W2;

[img3 ,cnt2] = find_red( image );

[img1,cnt] = find_ye( image );

if (cnt>cnt2 && cnt2 < size_mul / 10 )
 img1 = bwareafilt(img1,1);
% figure , imshow (img1) ;
 
%  img1 = imfill(img1 , 'holes') ;
 [ul_corner]=regionprops(img1,'BoundingBox');

  SEG = imcrop(image,[ul_corner.BoundingBox(1,1),  ul_corner.BoundingBox(1,2), ul_corner.BoundingBox(1,3) , ul_corner.BoundingBox(1,4)+20]);
% figure, imshow(SEG);
    
end

    if(cnt2>cnt || (cnt > cnt2 && cnt > size_mul / 10))
   
 img3 = bwareafilt(img3,1);
 
 [ul_corner]=regionprops(img3,'BoundingBox');
 
 
 SEG = imcrop(image,[ul_corner.BoundingBox(1,1), ul_corner.BoundingBox(1,2), ul_corner.BoundingBox(1,3), ul_corner.BoundingBox(1,4)]);
 %figure, imshow(SEG);
       
    end
    
%     elseif(cnt2>cnt || (cnt > cnt2&&cnt > size_mul / 20))
%    
%  img3 = bwareafilt(img3,1);
%  [ul_corner]=regionprops(img3,'BoundingBox');
%  v1=ul_corner.BoundingBox(1,1)-10;
%  v2=ul_corner.BoundingBox(1,2)-10;
%  v3 = ul_corner.BoundingBox(1,3)+25;
%  v4 = ul_corner.BoundingBox(1,4)+25;
%  
%  
%  crop = imcrop(image,[v1, v2, v3, v4]);
%  figure, imshow(crop);
    

   end


function [img1,counte ] = find_ye( image )
[H W L] = size(image);
imm = rgb2gray (image) ;
img1 = uint8(zeros(H,W,L));
%imshow (image) ;
if (H ==0|| W == 0)
    img1 =0 ;
end

for i = 1:H
    for j = 1:W
        
        if (abs(image(i,j,1)+image(i,j,2)) >= 150 && abs(image(i,j,3)) <= 80)
            img1 (i,j,:) =image (i,j,:) ;
        
        end
    end
end

% [h1,w1,l1] =size (img1);
% 
% counte = 0;
% 
% for q = 1:h1
%     for qq  = 1 :w1
%         if (img1(q , qq, l1)== (abs(img1(q,qq,1)+img1(q,qq,2)) >= 150 && abs(img1(q,qq,3)) <= 80))
%             counte = counte +1;
%         end
%     end
% end


img1 = im2bw (img1);
[h1,w1,l1] =size (img1);

counte = 0;

for q = 1:h1
    for qq  = 1 :w1
        if (img1 (q ,qq ,:)~=0)
            counte = counte +1;
        end
    end
end
%figure , imshow (img1);
end



function [ img2,counte2 ] = find_red( image )

[H1 W1 L] = size(image);
counte2 =0;
img2 = uint8(zeros(H1,W1,L));
imm2 = rgb2gray(image);
inn = medfilt2(imm2); 
%imshow (inn);
if (H1 == 0|| W1 ==0)
    img2 = 0;
end

for i = 1:H1
    for j = 1:W1
        
% if(image(i,j,1) >= 110 && image(i,j,2) <= 80 && image(i,j,3) <= 80)
% 
%     img2(i,j,:) = image(i,j,:);
%    counte2 =counte2+1 ;
% end

if(image(i,j,1) >= 98 && image(i,j,2) <= 106 && image(i,j,3) <= 115)

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
%figure , imshow (img2) ;

end

