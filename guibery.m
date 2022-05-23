function pushbutton1_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
[namafile]=uigetfile({'*.jpeg;*.jpg;*.bmp;*.tif'},'openimage');
I=imread(namafile);
set(open.figure1,'currentAxes',open.axes1);
set(imagesc(I));colormap('gray');
set (open.axes1,'Userdata',I);



function pushbutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=get(open.axes1,'Userdata');
fR=I(:,:,1);
fG=I(:,:,2);
fB=I(:,:,3);
fr=mean(mean(fR));
fb=mean(mean(fG));
fc=mean(mean(fB));
frr=fr/255;
fbb=fb/255;
fcc=fc/255;
total=(frr+fbb+fcc)/3;
h=(frr+fbb+fcc);
n=1.2;
n2=0.5;
m1='Matang';
m2='Setengah Matang';
m3='Mentah';
set(handles.edit1,'String',frr)
set(handles.edit2,'String',fbb)
set(handles.edit3,'String',fcc)
set(handles.edit4,'String',h)
if h <= n
    set(handles.edit5,'String',m1)
elseif fbb <= n2
    set(handles.edit5,'String',m2)
else
    set(handles.edit5,'String',m3)
end
