function [ reco_image,red,c,z] = test( image )
image=main_seg(image);
reco_img=image;
image=imresize(image ,[96 96]);
[ fiture1, fiture2, fiture3]=reco();
[red black yallow]=train(image);
red_fiture=1000000;
% black_fiture=100000;
reco_image=0;
% reco_image1=0;
for i=1: 8
    
    if(abs(red-fiture1(i))<=red_fiture)
    red_fiture=abs(red-fiture1(i));
    reco_image=i;
    end
    
    
    if(i==1)
        c=abs(red-fiture1(i));
        z=fiture1(i);
    else
        c=[c;abs(red-fiture1(i))];
        z=[z;fiture1(i)];
    end
    
    
    %%%%%%%%%%%%%%%%
%     if(abs(black-fiture2(i))<=black_fiture)
%     black_fiture=abs(black-fiture2(i));
%     reco_image1=i;
%     end
% if(i==1)
%         c=abs(black-fiture2(i));
%         z=fiture2(i);
%     else
%         c=[c;abs(black-fiture2(i))];
%         z=[z;fiture2(i)];
%     end
  %%%%%%%%%%%%%%%%%%%%%
end
       if(reco_image==1)
         imshow(reco_img); title('Passing prohibited');
       elseif(reco_image==2)
       imshow(reco_img); title('No entry');
       elseif(reco_image==3)
       imshow(reco_img); title('No turn left');
       elseif(reco_image==4)
       imshow(reco_img); title('No parking');
       elseif(reco_image==5)
       imshow(reco_img); title('Signal ahead');
       elseif(reco_image==6)
       imshow(reco_img); title('Roadway narrows');
       elseif(reco_image==7)
       imshow(reco_img); title('Deaf/blind people');
       elseif(reco_image==8)
       imshow(reco_img); title('Warning');
    end
       
    
% x=min(black_fiture,red_fiture);
end

