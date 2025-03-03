% Creates a linear array object.
a = linearArray;

% Assigns the microstrip patch antenna as the element of the array.
a.Element = p;

% Sets the spacing between elements in the array to 0.1 meters.
a.ElementSpacing = 0.1;

% Specifies the number of elements in the array as 4.
a.NumElements = 4;

% Displays the layout of the antenna array.
layout(a);
saveas(gcf, 'fig_e0B_array_layout.png');

% Plots the radiation pattern of the antenna array at 1.66 GHz.
pattern(a, 1.66e9);
saveas(gcf, 'fig_e0B_array_pattern.png');
