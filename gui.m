function varargout = gui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


function gui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
global im
im = 1;
axes(handles.axes1);
imshow(im);
axes(handles.axes2);
imshow(im);
axes(handles.axes9);
imshow(im);
axes(handles.axes14);
imshow(im);
axes(handles.axes15);
imshow(im);
axes(handles.axes10);
imshow(im);
axes(handles.axes11);
imshow(im);

function varargout = gui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% UPLOAD
function pushbutton1_Callback(hObject, eventdata, handles)
global im X map;
[path, user_chance] = imgetfile();
if user_chance
    msgbox(sprintf('Gambar yang diunggah adalah gambar yang salah.'), 'Error', 'Error');
    return
end
set(handles.edit7,'string',"Busy - Please wait!");
im = imread(path);
[X, map] = imread(path);
gbr = im;
axes(handles.axes1);
imshow(gbr);
set(handles.edit7,'string',"Done");

% Face retrieval
function pushbutton4_Callback(hObject, eventdata, handles)
global im imc;
set(handles.edit7,'string',"Busy - Please wait!");
fdetect = vision.CascadeObjectDetector;
BB = step(fdetect, im);
axes(handles.axes1);
imshow(im);
hold on
for i = 1:size(BB,1)
    rectangle('Position', BB(i, :), 'LineWidth', 1, 'LineStyle', '-', 'EdgeColor', 'r');
end
hold off
imc = imcrop(im, BB);
set(handles.edit7,'string',"Done");

% Wavelet Daubechies Transform
function pushbutton2_Callback(hObject, eventdata, handles)
global imc cA cH cV cD n_cA n_cH n_cV n_cD;
set(handles.edit7,'string',"Busy - Please wait!");
[cA, cH, cV, cD] = dwt2(imc, 'db5', 'mode', 'symh');
axes(handles.axes2);
imagesc(cA);
n_cA = sum(cA(:));
axes(handles.axes9);
imagesc(cH);
n_cH = sum(cH(:));
axes(handles.axes10);
imagesc(cV);
n_cV = sum(cV(:));
axes(handles.axes11);
imagesc(cD);
n_cD = sum(cD(:));
set(handles.edit7,'string',"Done");

% Nohis tree diagram
function pushbutton3_Callback(hObject, eventdata, handles)
global imc n_cH n_cV n_cD;
set(handles.edit7,'string',"Busy - Please wait!");
nohisv_max = 0;
load('db-data.mat');
[imc_x, imc_y, dim] = size(imc);
effh = num2str(abs(n_cH));
neffh = str2num(effh(1));
effv = num2str(abs(n_cV));
neffv = str2num(effh(1));
nohiseff = fspecial('Gaussian', [neffh neffv], 1.5);
imc = imfilter(imc, nohiseff, 'replicate');
imc_1 = imresize(imc_1, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_1);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"A. Tenri");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_1);
end
imc_2 = imresize(imc_2, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_2);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Abdul Azis");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_2);
end
imc_3 = imresize(imc_3, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_3);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Adit");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_3);
end
imc_4 = imresize(imc_4, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_4);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Agusman");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_4);
end
imc_5 = imresize(imc_5, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_5);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Ahmad");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_5);
end
imc_6 = imresize(imc_6, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_6);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Alam");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_6);
end
imc_7 = imresize(imc_7, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_7);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Arman");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_7);
end
imc_8 = imresize(imc_8, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_8);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Aso");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_8);
end
imc_9 = imresize(imc_9, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_9);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Atiek");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_9);
end
imc_10 = imresize(imc_10, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_10);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Cahyadi");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_10);
end
imc_11 = imresize(imc_11, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_11);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Fajrin");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_11);
end
imc_12 = imresize(imc_12, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_12);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Fauzan");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_12);
end
imc_13 = imresize(imc_13, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_13);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Firman");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_13);
end
imc_14 = imresize(imc_14, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_14);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Guntur");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_14);
end
imc_15 = imresize(imc_15, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_15);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Hamka");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_15);
end
imc_16 = imresize(imc_16, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_16);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Heriadi");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_16);
end
imc_17 = imresize(imc_17, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_17);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Ifa");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_17);
end
imc_18 = imresize(imc_18, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_18);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Ika");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_18);
end
imc_19 = imresize(imc_19, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_19);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Ira");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_19);
end
imc_20 = imresize(imc_20, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_20);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Irwan");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_20);
end
imc_21 = imresize(imc_21, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_21);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Kasmidar");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_21);
end
imc_22 = imresize(imc_22, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_22);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Lukman");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_22);
end
imc_23 = imresize(imc_23, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_23);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Lukman Arifin");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_23);
end
imc_24 = imresize(imc_24, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_24);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Mannan");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_24);
end
imc_25 = imresize(imc_25, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_25);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Miftah");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_25);
end
imc_26 = imresize(imc_26, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_26);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Ninsih");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_26);
end
imc_27 = imresize(imc_27, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_27);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Nur Qolbi");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_27);
end
imc_28 = imresize(imc_28, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_28);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Nuraeni");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_28);
end
imc_29 = imresize(imc_29, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_29);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Rahmat");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_29);
end
imc_30 = imresize(imc_30, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_30);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Rahmawati");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_30);
end
imc_31 = imresize(imc_31, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_31);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Rahmayani");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_31);
end
imc_32 = imresize(imc_32, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_32);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Rio");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_32);
end
imc_33 = imresize(imc_33, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_33);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Saharuddin");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_33);
end
imc_34 = imresize(imc_34, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_34);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Syahrir");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_34);
end
imc_35 = imresize(imc_35, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_35);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Syahrul");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_35);
end
imc_36 = imresize(imc_36, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_36);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Syahruddin");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_36);
end
imc_37 = imresize(imc_37, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_37);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Tri Umbara");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_37);
end
imc_38 = imresize(imc_38, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_38);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Ulfiani");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_38);
end
imc_39 = imresize(imc_39, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_39);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Wahyudin");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_39);
end
imc_40 = imresize(imc_40, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_40);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Yusak");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_40);
end
imc_41 = imresize(imc_41, [imc_x imc_y]);
[nohisv,nohismap] = ssim(imc, imc_41);
if (nohisv > nohisv_max)
    nohisv_max = nohisv;
    set(handles.edit8,'string',"Zahra");
    axes(handles.axes14);
    imshow(imc);
    axes(handles.axes15);
    imshow(imc_41);
end
set(handles.edit7,'string',"Done");

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
