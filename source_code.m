function varargout = Gian_do_pV(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gian_do_pV_OpeningFcn, ...
                   'gui_OutputFcn',  @Gian_do_pV_OutputFcn, ...
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
function Gian_do_pV_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
 
 
function varargout = Gian_do_pV_OutputFcn(hObject, eventdata, handles) 
 
varargout{1} = handles.output;
 
 
function menu_Callback(hObject, eventdata, handles)
function menu_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function congquatrinh_Callback(hObject, eventdata, handles)
function congquatrinh_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function congtoanphan_Callback(hObject, eventdata, handles)
function congtoanphan_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
function tinh_Callback(hObject, eventdata, handles)
n = str2num (get(handles.somol, 'string'));
v1 = str2num (get(handles.thetich1, 'string'));
v2 = str2num (get(handles.thetich2, 'string'));
p1 = str2num (get(handles.apsuat1, 'string'));
p2 = str2num (get(handles.apsuat2, 'string'));
w = str2num(get(handles.congtoanphan, 'string'));
R = 8.3145;
contents = get (handles.menu, 'string');
quatrinh = contents {(get(handles.menu, 'Value'))};
switch quatrinh
    case 'Qua trinh dang ap'
     if isempty(v2)==1
       msgbox('Moi ban nhap the tich moi','Thong bao', 'Ok');
     else
       t1 = (p1*v1)/(n*R);
       t2 = (p1*v2)/(n*R);
       set(handles.apsuat2, 'string', p1);
       set(handles.nhietdo1, 'string', t1);
       set(handles.nhietdo2, 'string', t2);
       w1 = -p1*(v2-v1)/1000;
       set(handles.congquatrinh, 'string', num2str(w1));
       set(handles.congtoanphan, 'string', num2str(w1+w));
       x = linspace(v1,v2,100);
       y = p1+0.*x;
       axes (handles.bieudo);
       plot(x,y, 'linewidth', 2, 'color', 'black');
       axis([0 100 0 1000]);
       grid on;
        xlabel('V(l)', 'color','w');
        ylabel('P(kPa)', 'color', 'w');
       hold on;
     end 
       
    case 'Qua trinh dang tich'
        if isempty(p2)==1
       msgbox('Moi ban nhap ap suat moi','Thong bao', 'Ok');
     else
        w1 = 0;
        t1 = (p1*v1)/(n*R);
        t2 = (p2*v1)/(n*R);
        set(handles.thetich2, 'string', v1);
        set(handles.nhietdo1, 'string', t1);
        set(handles.nhietdo2, 'string', t2);
        set(handles.congquatrinh, 'string', num2str(w1));
        set(handles.congtoanphan, 'string', num2str(w1+w));
        x = v1*ones(2,1);
        y = linspace (p1,p2,length(x));
        axes (handles.bieudo);
        plot(x,y, 'linewidth', 2, 'color', 'black');
        axis([0 100 0 1000]);
        grid on;
        xlabel('V(l)', 'color','w');
        ylabel('P(kPa)', 'color', 'w');
        hold on;
        end
      
    case 'Qua trinh dang nhiet'
        if (isempty(v2)==1)&(isempty(p2)==1);
       msgbox('Moi ban nhap the tich moi hoac ap suat moi','Thong bao', 'Ok');
        elseif (isempty(v2)==0)&(isempty(p2)==1);
        t1 = (p1*v1)/(n*R);
        set(handles.nhietdo1, 'string', num2str(t1));
        set(handles.nhietdo2, 'string', num2str(t1));
        p2 = (p1*v1)/v2;
        set(handles.apsuat2, 'string', num2str(p2));
        w1 = -n*R*t1*log(v2/v1)/1000;
        set(handles.congquatrinh, 'string', num2str(w1));
        set(handles.congtoanphan, 'string', num2str(w+w1));
        elseif (isempty(v2)==1)&(isempty(p2)==0);
        t1 = (p1*v1)/(n*R);
        set(handles.nhietdo1, 'string', num2str(t1));
        set(handles.nhietdo2, 'string', num2str(t1));
        v2 = (p1*v1)/p2;
        set(handles.thetich2, 'string', num2str(v2));
        w1 = -n*R*t1*log(v2/v1)/1000;
        set(handles.congquatrinh, 'string', num2str(w1));
        set(handles.congtoanphan, 'string', num2str(w1+w));
        elseif (isempty(v2)==0)&(isempty(p2)==0)
           msgbox('Vui long chi nhap the tich hoac ap suat moi', 'Thong bao', 'OK');
        end
        x = linspace (v1, v2, 200);
        y = (p1*v1)./x;
        plot(x,y, 'linewidth', 2, 'color', 'black');
        axis([0 100 0 1000]);
        grid on;
        xlabel('V(l)', 'color','w');
        ylabel('P(kPa)', 'color', 'w');
        hold on; 
        
end
 
 
function reset_Callback(hObject, eventdata, handles)
resetbutton=questdlg('Are you sure?', 'Confirm', 'Yes', 'No', 'No');
switch resetbutton
    case 'Yes'
        set(handles.somol, 'string', ' ');
        set(handles.apsuat1, 'string', ' ');
        set(handles.apsuat2, 'string', ' ');
        set(handles.thetich1, 'string', ' ');
        set(handles.thetich2, 'string', ' ');
        set(handles.nhietdo1, 'string', ' ');
        set(handles.nhietdo2, 'string', ' ');
        set(handles.congquatrinh, 'string', 0);
        set(handles.congtoanphan, 'string', 0);
        axes(handles.bieudo)
        cla reset;
        axis ([0 100 0 1000]);
        grid on;
        xlabel('V(l)', 'color', 'w');
        ylabel('P(kPa)', 'color', 'w');
end
 
 
function Next_Callback(hObject, eventdata, handles)
n = str2num (get(handles.somol, 'string'));
v2 = str2num (get(handles.thetich2, 'string'));
p2 = str2num (get(handles.apsuat2, 'string'));
R = 8.3145;
t2 = (p2*v2)/(n*R);
set(handles.thetich1, 'string', v2);
set(handles.thetich2, 'string', ' ');
set(handles.apsuat1, 'string', p2);
set(handles.apsuat2, 'string', ' ');
set(handles.nhietdo1, 'string', t2);
set(handles.nhietdo2, 'string', ' ');
 
 
function close_Callback(hObject, eventdata, handles)
choice = questdlg('Would you like to quit?', ...
                  'Choice menu', ....
                  'Yes', 'No', 'Yes');
switch choice
 
    case 'Yes'
    close
end
 
 
function somol_Callback(hObject, eventdata, handles)
function somol_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function thetich1_Callback(hObject, eventdata, handles)
function thetich1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function thetich2_Callback(hObject, eventdata, handles)
function thetich2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function apsuat1_Callback(hObject, eventdata, handles)
function apsuat1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function apsuat2_Callback(hObject, eventdata, handles)
function apsuat2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function nhietdo1_Callback(hObject, eventdata, handles)
function nhietdo1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
 
 
 
function nhietdo2_Callback(hObject, eventdata, handles)
function nhietdo2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


