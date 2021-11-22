function [ myhandles ] = make_spaceship(trf_root, transparency)
% Makes a space-ship with the root transform as the given transform.
% The surfaces are drawn with the given transparency in [0,1]
% A vector of handles to all the surfaces is returned.

ship_dish_profile= 2*sin(linspace(0, pi, 15));
[Xc, Yc, Zc]= cylinder(ship_dish_profile);

% Top dish
trf_top_root= hgtransform('Parent', trf_root);
set(trf_top_root, 'Matrix', makehgtform('translate', [0, 0, -0.2]));
color_top= [0.3, 0.5, 1];
myhandles(1)= surface(Xc, Yc, Zc, 'Parent', trf_top_root, 'FaceColor', color_top, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);

% Bottom dish
trf_bottom_root= hgtransform('Parent', trf_root);
set(trf_bottom_root, 'Matrix', makehgtform('translate', [0, 0, 0.2]));
color_bottom= [1, 1, 1];
myhandles(2)= surface(Xc, Yc, Zc, 'Parent', trf_bottom_root, 'FaceColor', color_bottom, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bottom, 'EdgeAlpha', transparency);

%creates x,y,z coordinates for upper dish
[Xu, Yu, Zu]= cylinder([1.7, 1.5, 0.0]);

%creates another top dish(upper)
trf_upper_root= hgtransform('Parent', trf_root);
set(trf_upper_root, 'Matrix', makehgtform('translate', [0, 0, 0.4]));
color_upper = [0.7 1 0.25];
myhandles(6) = surface( Xu, Yu, Zu, 'Parent', trf_upper_root, 'FaceColor', color_upper, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_upper, 'EdgeAlpha', transparency);



% creates x, y, z coordinates of unit cylinder to draw left and right tail
[Xt, Yt, Zt]= cylinder([0.4 , 0.3 , 0]);


% Left tail
trf_tailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-3, 0.75, 2]);
% Interpret the order as BFT (left to right)
set(trf_tailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_left= [1 1 1]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailleft_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);


% Right tail
trf_tailright_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-3, -0.75, 2]);
% Interpret the order as BFT (left to right)...
set(trf_tailright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_right= [0 0.1 0.76]; 
myhandles(4)= surface(Xt, Yt, Zt, 'Parent', trf_tailright_root, 'FaceColor', color_tail_right, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_right, 'EdgeAlpha', transparency);

%creates x, y, z coordinates of unit cylinder to draw left and right joint
[Xj, Yj, Zj]= cylinder([0.1, 0.3, 0.3]);


%Left Joint
trf_jointleft_root = hgtransform('Parent', trf_root);
trf_scale = makehgtform('scale', [1,1,3]);
trf_Ry = makehgtform('yrotate', -pi/4);
trf_T = makehgtform('translate', [-1.5, 0.75, 0]);
% Interpret the order as BFT(left to right)
color_joint_left = [0 0.55 1];
myhandles(5) = surface(Xj, Yj, Zj, 'Parent', trf_jointleft_root, 'FaceColor', color_joint_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_joint_left, 'EdgeAlpha', transparency);
set(trf_jointleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);

%Right Joint
trf_jointright_root = hgtransform('Parent', trf_root);
trf_scale = makehgtform('scale', [1,1,3]);
trf_Ry = makehgtform('yrotate', -pi/4);
trf_T = makehgtform('translate', [-1.5, -0.75, 0]);
% Interpret the order as BFT(left to right)
color_joint_right = [0 0.55 1];
myhandles(5) = surface(Xj, Yj, Zj, 'Parent', trf_jointright_root, 'FaceColor', color_joint_right, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_joint_right, 'EdgeAlpha', transparency);
set(trf_jointright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
  


% Your code here. Use left tail as a reference and design spaceship as
% shown in the class. You can come up with a new design.
end

