clc;clear;close all;

load racoon_hw1;

img = render(vertices_2d,faces,vertex_colors,depth,'gouraud');

imwrite(img,'racoon_gouraud.png');

fprintf('Please check your files for\na beautiful gouraud racoon image.\n');
