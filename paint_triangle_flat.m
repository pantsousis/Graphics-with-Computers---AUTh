function result = paint_triangle_flat(img,vertices_2d,vertex_colors)
    
    %The flat color that we are going to paint with
    color = 1/3*sum(vertex_colors);
    
    %Find all pixels that belong to the sides
    side1=vertices_2d(1:2,:);
    side2=vertices_2d(2:3,:);
    side3=[vertices_2d(1,:);vertices_2d(3,:)];
    side_pixels = [bresenham(side1);bresenham(side2);bresenham(side3)];
    
    %'Paint' the pixels of the sides before we start. In this case, with a
    %flat color
    for i=1:length(side_pixels)
        img(side_pixels(i,2),side_pixels(i,1),:)=color;
    end
    
    %Find scanline boundaries
    ymin = min(vertices_2d(:,2));
    ymax = max(vertices_2d(:,2));
    
    %   For each scanline, find the filling space. To do this, we add to the
    %current scanline (y=c) all the pixels that belong to a side and y = c.
    %   After that, we simply paint all the pixels that DON'T belong to a
    %side, since we have already painted the side pixels, with a flat color.
    
    for i=ymin:ymax
        rows = find(side_pixels(:,2) == i); %Find the row of every pixel with y = i
        cur_scan_x = transpose(side_pixels(rows,1)); %Keep only the x value of the points found
        cur_scan_x = sort(cur_scan_x); %Sort so that highest values are last
        %Keep and color every point NOT in the scan
        n = length(cur_scan_x);
        for j = cur_scan_x(1):cur_scan_x(n)
            if isempty(find(cur_scan_x == j)) %If i is not in the scan
                img(i,j,:)=color;
            end
        end
    end

    result = img;
end