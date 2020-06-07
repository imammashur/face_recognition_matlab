global im imc X map;
[path, user_chance] = imgetfile();
if user_chance
    msgbox(sprintf('Gambar yang diunggah adalah gambar yang salah.'), 'Error', 'Error');
    return
end
im = imread(path);
[X, map] = imread(path);
gbr = im;
imshow(gbr);
fdetect = vision.CascadeObjectDetector;
BB = step(fdetect, im);
imshow(im);
hold on
for i = 1:size(BB,1)
    rectangle('Position', BB(i, :), 'LineWidth', 1, 'LineStyle', '-', 'EdgeColor', 'r');
end
hold off
imc = imcrop(im, BB);
imc_BERIKUTNYA = imc;
