function varargout = NewDiscover(varargin)
% NEWDISCOVER MATLAB code for NewDiscover.fig
%      NEWDISCOVER, by itself, creates a new NEWDISCOVER or raises the existing
%      singleton*.
%
%      H = NEWDISCOVER returns the handle to a new NEWDISCOVER or the handle to
%      the existing singleton*.
%
%      NEWDISCOVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWDISCOVER.M with the given input arguments.
%
%      NEWDISCOVER('Property','Value',...) creates a new NEWDISCOVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NewDiscover_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NewDiscover_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NewDiscover

% Last Modified by GUIDE v2.5 24-Jul-2018 00:40:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NewDiscover_OpeningFcn, ...
                   'gui_OutputFcn',  @NewDiscover_OutputFcn, ...
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

% --- Executes just before NewDiscover is made visible.
function NewDiscover_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NewDiscover (see VARARGIN)

% Choose default command line output for NewDiscover
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using NewDiscover.
% if strcmp(get(hObject,'Visible'),'off')
%     plot(rand(5));
% end
global global_icons;
global global_im;
global global_locals;
global global_currentblock;
global global_pause_im;
global global_occupied_pos;
load('./Data/DataIcon.mat','DataIcon');
global_occupied_pos= {};
global_icons = DataIcon;
global_im = imread('./Data/0.jpg');
global_pause_im = imread('./Data/0.png');
[cols,rows]= meshgrid(1:9,1:14);
global_locals = [cols(:) rows(:)];
global_currentblock = [0 0];
add_icon();
imshow(global_im);
axis on
grid on
% UIWAIT makes NewDiscover wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = NewDiscover_OutputFcn(hObject, eventdata, handles)
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
% axes(handles.axes1);
% % add_icon();
% % global global_im;
% % imshow(global_im)
% 
% 
% 
% popup_sel_index = get(handles.popupmenu1, 'Value');
% switch popup_sel_index
%     case 1
%         plot(rand(5));
%     case 2
%         plot(sin(1:0.01:25.99));
%     case 3
%         bar(1:.5:10);
%     case 4
%         plot(membrane);
%     case 5
%         surf(peaks);
% end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});

% function pushmousebutton1_Callback(hObject, eventdata, handles)
% % axes(handles.axes1);
% add_icon();
% global global_im;
% imshow(global_im);
% axis on
% grid on

function add_icon()
blockRg = 108;%Ã¿¸öÍ¼Ïñ¿éµÄ³ß´ç
rg = 1:blockRg;
global global_icons;
global global_im;
global global_locals;
global global_currentblock;
global global_occupied_pos;
len_i  = length(global_icons);
len_l = size(global_locals,1);
temp_block = global_icons{ceil(len_i*rand(1))};
sel = ceil(len_l*rand(1));
temp_pos = global_locals(sel,:);

global_locals(sel,:) = []; 
rows = 208+rg+(temp_pos(2)-1)*blockRg;
cols = 107+rg+(temp_pos(1)-1)*blockRg;
global_currentblock = [cols([1 end]);rows([1 end])];
global_occupied_pos{length(global_occupied_pos)+1} = global_currentblock;
global_im(rows,cols,1) = temp_block;
global_im(rows,cols,2) = temp_block;
global_im(rows,cols,3) = temp_block;



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


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_currentblock;
global global_im;
pt = get(gca,'CurrentPoint');
x = pt(1,1);
y = pt(1,2);
flag1 = global_currentblock(1,1)<=x&&x<=global_currentblock(1,2);
flag2 = global_currentblock(2,1)<=y&&y<=global_currentblock(2,2);
if flag1&&flag2
add_icon();
imshow(global_im);
end

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_currentblock;
global global_im;
global global_pause_im;
global global_occupied_pos;
pt = get(gca,'CurrentPoint');
x = pt(1,1);
y = pt(1,2);
flag1 = global_currentblock(1,1)<=x&&x<=global_currentblock(1,2);
flag2 = global_currentblock(2,1)<=y&&y<=global_currentblock(2,2);
if flag1&&flag2
imshow(global_pause_im);
pause(2);
add_icon();
imshow(global_im);
else 
    len = length(global_occupied_pos);
    for i = 1:len
        temp_pos = global_occupied_pos{i};
        flag1 = temp_pos(1,1)<=x&&x<=temp_pos(1,2);
        flag2 = temp_pos(2,1)<=y&&y<=temp_pos(2,2);
        if flag1&&flag2
            warning('you lost!try again!');
            pause(2);
            exit(1);
        end
    end
end
