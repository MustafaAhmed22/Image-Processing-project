function [img1,counte ] = find_ye( image )
[H W L] = size(image);
imm = rgb2gray (image) ;
img1 = uint8(zeros(H,W,L));
imshow (image) ;
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
        if (img1 (q ,qq ,:) ~=0)
            counte = counte +1;
        end
    end
end
figure , imshow (img1);
end
