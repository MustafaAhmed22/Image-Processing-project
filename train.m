function [ counter , counter1 , counter2 ] = train( image )
[H,W,L] = size(image);
%img1 = uint8(zeros(H,W,L));
counter = 0;
counter1 = 0;
counter2 = 0;
for i=1 : H
    for j=1 : W
        %count red pixels
        if(image(i,j,1) >= 125 && image(i,j,2) <= 100 && image(i,j,3) <= 100)
        %img1(i,j,:) = image(i,j,:);
        counter = counter +1 ;
        end
    end
end
for i=1 : H
    for j=1 : W
        %count black pixels
        if(image(i,j,:)>=0 )
            if( image(i,j,:)<=50)
        %img1(i,j,:) = image(i,j,:);
        counter1 = counter1 +1 ;
            end
        end
    end
end

for i = 1:H
    for j = 1:W
        
        if (abs(image(i,j,1)+image(i,j,2)) >= 150 && abs(image(i,j,3)) <= 80)
            counter2 = counter2 + 1;
        end
    end
end


end

