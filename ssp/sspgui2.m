function varargout = sspgui2(varargin)
% SSPGUI2 M-file for sspgui2.fig
%      SSPGUI2, by itself, creates a new SSPGUI2 or raises the existing
%      singleton*.
%
%      H = SSPGUI2 returns the handle to a new SSPGUI2 or the handle to
%      the existing singleton*.
%
%      SSPGUI2('CALLBACK',hObje0ct,eventData,handles,...) calls the local
%      function named CALLBACK in SSPGUI2.M with the given input arguments.
%
%      SSPGUI2('Property','Value',...) creates a new SSPGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sspgui2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sspgui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sspgui2

% Last Modified by GUIDE v2.5 14-Apr-2003 16:34:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sspgui2_OpeningFcn, ...
                   'gui_OutputFcn',  @sspgui2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before sspgui2 is made visible.
function sspgui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sspgui2 (see VARARGIN)
if nargin < 4
    handles.N=2048;
    fid = fopen('newscan1.dat','r');%160 and 16
    %load 'win250_1.mat';%20 and 6
    %handles.uecho=u;
    handles.uecho=fread(fid,handles.N,'double')';
    %load ('C:\Users\Kushal\Documents\MATLAB\Original\new scan_in ssp folder\echo_data');
    %handles.uecho=echo_data(1,:);
    figure;
    plot(abs(handles.uecho));
elseif (length(varargin) == 4 & strcmpi(varargin{1},'N') & strcmpi(varargin{3},'uecho'))
    handles.N=varargin{2};
    handles.uecho=varargin{4};
end
% Choose default command line output for sspgui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sspgui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sspgui2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function transform_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to transform_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in transform_type.
function transform_type_Callback(hObject, eventdata, handles)
% hObject    handle to transform_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns transform_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from transform_type


% --- Executes during object creation, after setting all properties.
function no_of_windows_CreateFcn(hObject, eventdata, handles)
% hObject    handle to no_of_windows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function no_of_windows_Callback(hObject, eventdata, handles)
% hObject    handle to no_of_windows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of no_of_windows as text
%        str2double(get(hObject,'String')) returns contents of no_of_windows as a double


% --- Executes during object creation, after setting all properties.
function window_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function window_size_Callback(hObject, eventdata, handles)
% hObject    handle to window_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of window_size as text
%        str2double(get(hObject,'String')) returns contents of window_size as a double


% --- Executes during object creation, after setting all properties.
function offset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function offset_Callback(hObject, eventdata, handles)
% hObject    handle to offset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of offset as text
%        str2double(get(hObject,'String')) returns contents of offset as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N=handles.N;

uecho=handles.uecho;

no_of_windows=str2double(get(handles.no_of_windows,'string'));
window_size=str2double(get(handles.window_size,'string'));
window_offset=str2double(get(handles.offset,'string'));
window_width=0.5;
val = get(handles.transform_popupmenu,'Value');
str = get(handles.transform_popupmenu, 'String');

ssp_windows=zeros(no_of_windows,N);
reconstructed_ssp=zeros(no_of_windows,N);


switch str{val};
case 'FFT' 
    t_uecho=(fft(uecho));
    single_window=window(@gausswin,window_size,window_width);
    single_window=single_window';
    cla;
    t_uecho(1)=0;
    figure;
    plot(abs(t_uecho)/max(abs(t_uecho)));
    
    
    hold;
   % figure;
    title('Gaussian windows for SSP');
    %axes(handles.axes1);
        
    for i=1:1:no_of_windows
        ssp_windows(i,(i-1)*window_offset+2:(i-1)*window_offset+window_size+1)=single_window;
        ssp_windows(i,N+2-(i-1)*window_offset-window_size-1:N+2-(i-1)*window_offset-2)=single_window;
       % subplot(no_of_windows,1,i);
        plot(ssp_windows(i,:),'r');
    end
    hold off;
case 'DCT' 
    t_uecho=dct(uecho);
    single_window=window(@gausswin,window_size,window_width);
    single_window=single_window';
    cla;
    t_uecho(1)=0;
    figure;
    plot(abs(t_uecho)/max(abs(t_uecho)));
    hold;
    figure;
    title('Gaussian windows for SSP');
    for i=1:1:no_of_windows
        ssp_windows(i,(i-1)*window_offset+2:(i-1)*window_offset+window_size+1)=single_window;
        subplot(no_of_windows,1,i);
        plot(ssp_windows(i,:),'r');
    end
    hold off;
case 'WHT' 
    %z=wht(N);
    %fid = fopen('wh2048.dat','r');
    %z=fread(fid,handles.N,'double')';
    load z;
    t_uecho=z*uecho';
    t_uecho=t_uecho';
    t_uecho(1)=0;
    single_window=window(@gausswin,window_size,window_width);
    single_window=single_window';
    cla;
    figure;
    plot(abs(t_uecho)/max(abs(t_uecho)));
    hold;
   % figure;
    title('Gaussian windows for SSP');
    for i=1:1:no_of_windows
        ssp_windows(i,(i-1)*window_offset+2:(i-1)*window_offset+window_size+1)=single_window;
       % subplot(no_of_windows,1,i);
        plot(ssp_windows(i,:),'r');
    end
    hold off;
    %h=daubcqf(6);
    %[t_uecho,L]=mdwt(uecho,h);
    %single_window=window(@gausswin,window_size,window_width);
    %single_window=single_window';
    %cla;
    %%t_uecho(1)=0;
    %plot(abs(t_uecho)/max(abs(t_uecho)));
    %hold;
    %title('Gaussian window for SSP');
    %for i=1:1:no_of_windows
    %    ssp_windows(i,(i-1)*window_offset+2:(i-1)*window_offset+window_size+1)=single_window;
    %    plot(ssp_windows(i,:),'r');
    %end
   % hold off;
end



%Multiply transform domain signal with individual windows
for i=1:1:no_of_windows
    ssp_windows(i,:)=ssp_windows(i,:).*t_uecho;
end
figure;
for i=1:1:no_of_windows
        subplot(no_of_windows,1,i);
        plot(real(ssp_windows(i,:)));
end
%figure;
%for i=1:1:no_of_windows
 %       subplot(no_of_windows,1,i);
  %      plot(rssp_windows(i,:));
%end

%Reconstruct the signal for each window
switch str{val};
case 'FFT' 
    for i=1:1:no_of_windows
        reconstructed_ssp(i,:)=ifft(ssp_windows(i,:));
        mx=max(abs(reconstructed_ssp(i,:)));
        reconstructed_ssp(i,:)=reconstructed_ssp(i,:)/mx; %normalize them
        subplot(no_of_windows,1,i);
        %plot(abs(reconstructed_ssp(i,:)));
        plot(real(reconstructed_ssp(i,:)));
         recon_ssp(i,:)=real(reconstructed_ssp(i,:));
    end
   
    save('C:\Users\kushal\Documents\MATLAB\ssp\win250nffil_1.mat','recon_ssp');
case 'DCT' 
    for i=1:1:no_of_windows
        reconstructed_ssp(i,:)=idct(ssp_windows(i,:));
        mx=max(abs(reconstructed_ssp(i,:)));
        reconstructed_ssp(i,:)=reconstructed_ssp(i,:)/mx; %normalize them
        subplot(no_of_windows,1,i);
        %plot(abs(reconstructed_ssp(i,:)));
        plot(real(reconstructed_ssp(i,:)));
    end
 case 'WHT' 
    for i=1:1:no_of_windows
        tmp=z*(ssp_windows(i,:))';
        reconstructed_ssp(i,:)=tmp';
        mx=max(abs(reconstructed_ssp(i,:)));
        reconstructed_ssp(i,:)=reconstructed_ssp(i,:)/mx; %normalize them
        subplot(no_of_windows,1,i);
        %plot(abs(reconstructed_ssp(i,:)));
        plot(real(reconstructed_ssp(i,:)));
    end 
    %for i=1:1:no_of_windows
    %    [reconstructed_ssp(i,:),L]=midwt(ssp_windows(i,:),h);
    %    mx=max(abs(reconstructed_ssp(i,:)));
    %    reconstructed_ssp(i,:)=reconstructed_ssp(i,:)/mx; %normalize them
    %end
end
%Display the time domain signals for each windows
%subplot(handles.axes1);
%for i=1:1:no_of_windows
%    subplot(no_of_windows,1,i);
%    plot(abs(reconstructed_ssp(i,:)));
%end
handles.reconstructed_ssp=reconstructed_ssp;
guidata(hObject, handles);
 
 
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N=handles.N;
new=handles.reconstructed_ssp';
%Detection Methods:


val = get(handles.analysis_popupmenu,'Value');
str = get(handles.analysis_popupmenu, 'String');

switch str{val};
case 'Minimum' 
    %Find the minimum:
    minim=zeros(1,N);
    for j=1:1:N
        minim(j)=min(abs((new(j,:))));
    end
    %axes(handles.axes1);
    %subplot(1,1,1);
    figure;
    plot(minim);
    title('Reconstruction using MIN values');
    
    minim_temp=minim;
    [a,b]=max(minim_temp);
    
    for i=b-100:1:b+100
        minim_temp(i)=0;
    end
    [c,d]=max(minim_temp);
    
    SNRdB=20*log10(a/c)
    
    
case 'Median' 
    %Find the median
    med=zeros(1,N);
    for j=1:1:N
        med(j)=median(abs((new(j,:))));
    end
    %axes(handles.axes1);
    %subplot(1,1,1);
    figure;
    plot(med);
    title('Reconstruction using MEDIAN values');
end
%hold off;

%Find the geometric mean
%gm=zeros(1024);
%gm=abs((reconstructed_ssp(1,:).*reconstructed_ssp(2,:).*reconstructed_ssp(3,:).*reconstructed_ssp(4,:).*reconstructed_ssp(5,:))).^0.2;
%figure;
%plot(gm);
%title('Geometric');





% --- Executes during object creation, after setting all properties.
function analysis_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to analysis_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in analysis_popupmenu.
function analysis_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to analysis_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns analysis_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from analysis_popupmenu





% --- Executes during object creation, after setting all properties.
function transform_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to transform_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in transform_popupmenu.
function transform_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to transform_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns transform_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from transform_popupmenu


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function print_Callback(hObject, eventdata, handles)
% hObject    handle to print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%print (handles.axes1,'-deps', 'figuretemp');
print -depsc figuretemp;
% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Load_Callback(hObject, eventdata, handles)
% hObject    handle to Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile( ...
    {'*.dat', 'All MAT-Files (*.mat)'; ...
        '*.*','All Files (*.*)'}, ...
    'Select Data File');
% If "Cancel" is selected then return
if isequal([filename,pathname],[0,0])
    return
% Otherwise construct the fullfilename and Check and load the file
else
    File = fullfile(pathname,filename);
    % if the MAT-file is not valid, do not save the name
    %fid = fopen(File,'r');
    %handles.uecho=fread(fid,handles.N,'double')';
    handles.uecho=load(filename);
    
    %handles.uecho=d.echo_data(15,:);
    figure;
    plot(abs(handles.uecho));
end
guidata(hObject, handles);
