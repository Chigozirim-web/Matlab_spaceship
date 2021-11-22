clear all
clf
handle_axes= axes('XLim', [-40 40], 'YLim', [-40 30], 'ZLim', [-30 40]);
xlabel('e_1');
ylabel('e_2');
zlabel('e_3');

view(3);
grid on;

camlight

% Create ship-1
trf_ship1_root= hgtransform('Parent', handle_axes);
%Parent, specified as an Axes, Group, or Transform object.
h_original_ship= make_spaceship(trf_ship1_root, 0.8);

pause('on')

%For the spaceship to move in a nice trajectory
drawnow
a = linspace(-30,25,45);
b = linspace(-1,1,45);
c = [linspace(0, 1, 15), linspace(1, -1, 15), linspace(-1, 0, 15)];
d = [linspace(0,10,20), linspace(10,0,25)];

for i = 1:numel(a)
    trf_t = makehgtform('translate', [a(i), b(i), d(i)]);
    trf_R = makehgtform('zrotate', c(i));
    
    trf_final= trf_t*trf_R;
    
    set(trf_ship1_root, 'Matrix', trf_final);
    pause(0.1);
   
end
