function varargout = project(varargin)
% PROJECT M-file for project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%     PROJECT('Property','Value',...) creates a new PROJECT or raises the

%      existing singleton*.  Starting from the left, property value pairs are

%      applied to the GUI before project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_OpeningFcn via varargin.
%

%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 07-Sep-2017 01:47:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
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


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im=imread(path);
im=im2double(im);
im2=im;
axes(handles.axes1);
imshow(im);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im2 
axes(handles.axes1);
imshow(im2);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imgray=(im(:,:,1)+im(:,:,2)+im(:,:,1))/3;
axes(handles.axes1);
imshow(imgray);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
imgray=(im(:,:,1)+im(:,:,2)+im(:,:,1))/3;
imhist=histeq(imgray);
axes(handles.axes1);
imshow(imhist);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
hsv=rgb2hsv(im);
hueimg=hsv(:,:,1);
saturationimg=hsv(:,:,2);
valueimg=hsv(:,:,3);
bluePixels=hueimg>0.3 & hueimg<0.8 & valueimg<0.8;
saturationimg(bluePixels)=saturationimg(bluePixels)*9.5;
axes(handles.axes1);
imshow(saturationimg);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
hsv=rgb2hsv(im);
hueimg=hsv(:,:,1);
saturationimg=hsv(:,:,2);
valueimg=hsv(:,:,3);
bluePixels=hueimg>0.3 & hueimg<0.8 & valueimg<0.8;
saturationimg(bluePixels)=saturationimg(bluePixels)*9.5;
axes(handles.axes1);
imshow(im2bw(saturationimg,0.97));


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
hsv=rgb2hsv(im);
hueimg=hsv(:,:,1);
saturationimg=hsv(:,:,2);
valueimg=hsv(:,:,3);
bluePixels=hueimg>0.3 & hueimg<0.8 & valueimg<0.8;
saturationimg(bluePixels)=saturationimg(bluePixels)*9.5;
i1=im2bw(saturationimg,0.97);
imag_bw_label=logical(i1);
axes(handles.axes1);
imshow(label2rgb(imag_bw_label));
propiedades=regionprops(imag_bw_label);
m=length(propiedades);
for k=1:m
    caja=propiedades(k).BoundingBox;
    rectangle('Position',[caja(1),caja(2),caja(3),caja(4)],...
        'EdgeColor','r','Linewidth',1)
end

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
I=rgb2gray(im);

hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
axes(handles.axes1);
imshow(gradmag,[]);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
I1=rgb2gray(im);
I2=imtophat(I1,strel('disk',50));
I3=imadjust(I2);
level=graythresh(I3);
BW=im2bw(I3,level);
C=~BW;
D=-bwdist(C);
D(C)=-Inf;
L=watershed(D);
Wi=label2rgb(L,'spring','w');
i=im;
i(L==0)=0;
axes(handles.axes1);
imshow(i);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im
hsv=rgb2hsv(im);
hueimg=hsv(:,:,1);
saturationimg=hsv(:,:,2);
valueimg=hsv(:,:,3);
bluePixels=hueimg>0.3 & hueimg<0.8 & valueimg<0.8;
saturationimg(bluePixels)=saturationimg(bluePixels)*9.5;
i1=im2bw(saturationimg,0.97);
imag_bw_label=logical(i1);
axes(handles.axes1);
propiedades=regionprops(imag_bw_label);
m=length(propiedades);
if (m~=0)
    msgbox('Parasite Detected');
else
    msgbox('Parasite Not Detected');
end