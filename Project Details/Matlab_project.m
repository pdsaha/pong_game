function varargout = Matlab_project(varargin)
% MATLAB_PROJECT MATLAB code for Matlab_project.fig
%      MATLAB_PROJECT, by itself, creates a new MATLAB_PROJECT or raises the existing
%      singleton*.
%
%      H = MATLAB_PROJECT returns the handle to a new MATLAB_PROJECT or the handle to
%      the existing singleton*.
%
%      MATLAB_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLAB_PROJECT.M with the given input arguments.
%
%      MATLAB_PROJECT('Property','Value',...) creates a new MATLAB_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Matlab_project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Matlab_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Matlab_project

% Last Modified by GUIDE v2.5 21-Feb-2022 14:02:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Matlab_project_OpeningFcn, ...
                   'gui_OutputFcn',  @Matlab_project_OutputFcn, ...
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


% --- Executes just before Matlab_project is made visible.
function Matlab_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Matlab_project (see VARARGIN)

% Choose default command line output for Matlab_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes Matlab_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Matlab_project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global level;
    level=1;            %%setting initial level as 1 

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
    
    % Starting  Of block 1"
    pause(1);

    global increase_bat;
    global increase_bat2;
    global level;
    global fact;    %% "fact" variable works for pause button 
    fact=0;
    
    increase_bat=0.0;
    increase_bat2=0.0;
    global ball_ini_pos_x;  %% INITIAL POSITION OF THE BALL AT X_40
    ball_ini_pos_x=40;
    global ball_ini_pos_y;
    ball_ini_pos_y=30;   %% INITIAL POSITION OF BALL at y 
    %%creating board 
    board_axis=axes('color','[0.1 ,0.1, 0.1]','xlim',[0 80],'ylim',[0 100],'Position',[0.1 0.15 0.35 0.8]);
                                                                 % setting parameters for inner board color 
    set(gca,'XColor', 'none','YColor','none')
    ball_define=line(ball_ini_pos_x,ball_ini_pos_y,'marker','.','markersize',25,'color',[0.4 1 .3]);  
                                                                  %defining ball size color other staff
    bat_define=line( [40 50],[4 4],'linewidth',5,'color',[0.1 0.9 0.93]);
    bat2_define=line( [40 50],[96 96],'linewidth',5,'color',[0.8 0.9 0.93]);
                                                                  %defining bat size   color and other staff 
   % border_define_1=line([0 80] ,[-.0001 -.0001],'linewidth',0.3,'color',[1 0 0],'marker','.');
                                   %defining  border line of the board 
    %border_define_2=line([0 80] ,[100.0001 100.0001],'linewidth',0.3,'color',[1 0 0],'marker','.');
                                    
   % border_define_3=line([0 0] ,[0 100],'linewidth',0.3,'color',[0 0 0],'marker','.','linewidth',3);
    %border_define_4=line([80 80] ,[0 100],'linewidth',0.3,'color',[0 0 0],'marker','.','linewidth',3);
    
    global ball_ini_velo;
    global ball_gen_velo;
    global ball_gen_pos_x;
    global ball_gen_pos_y;
    ball_ini_velo=[0.6 0.5]; % initial velocity vector for x co-ordinates and Y Co_ordinates
    ball_gen_velo=ball_ini_velo; 
    ball_gen_pos_x=ball_ini_pos_x;
    ball_gen_pos_y=ball_ini_pos_y;
    global bat_x1;
    global bat_x2;
    bat_x1=40;
    bat_x2=50;
               
    global bat2_x1;
    global bat2_x2;
                 bat2_x1=40;
                 bat2_x2=50;
    global program;
    global score2;
    score2=0;
    global score1;
    score1=0;
    program=true;
    
    %%% """finishing of  Block 1""" 
    
    
   
 while(program)
                        
     %%% block 2 hittng the right or left wall""
        if(ball_gen_pos_x<0|| ball_gen_pos_x>80  )  
             ball_gen_velo(1)= -ball_gen_velo(1)+rand()/100;  
             ball_gen_velo(2)= ball_gen_velo(2)+rand()/100;
        end
        
        
      %%% finshing block 2
      
      %%% block 3 bat hitting condtion
      
        if(ball_gen_pos_y<5 && ball_gen_pos_y>4 && ball_gen_pos_x > bat_x1-1 && ball_gen_pos_x <bat_x2+1 )
                ball_gen_velo(1)= ball_gen_velo(1)+rand()/100;
                ball_gen_velo(2)= -ball_gen_velo(2);
                                                       % 1st bat hitting  condition&& ball_gen_pos_y>2.9
                                                       

        end
        if(ball_gen_pos_y<95.5 && ball_gen_pos_y>95 && ball_gen_pos_x > bat2_x1-1 && ball_gen_pos_x <bat2_x2+1)
              ball_gen_velo(1)= ball_gen_velo(1)+rand()/100;
              ball_gen_velo(2)= -ball_gen_velo(2);
                                                       %2nd bat hitting  condition
                                                      

        end
        
        %%%finishing of block 3
        
        
        %%starting of block 4 %% passing bat & scoring 
        
        if(ball_gen_pos_y<0 && ball_gen_pos_x>0 &&  ball_gen_pos_x<80)
            ball_gen_pos_x=35;
            ball_gen_pos_y=77;
            score2=score2+1;  % 1st bat over pass
            %%ball_gen_velo(2)= -ball_gen_velo(2)+rand()/10;
            set(handles.text4,'string',num2str(score2));
            pause(0.5);
        end
             
           
             if(score2==7)
               h=msgbox('player  2 won');
               pause(1);
               program=false ;
               delete(handles.figure1);
            end
           
                
        if(ball_gen_pos_y>100 && ball_gen_pos_x>0 && ball_gen_pos_x<80)
            ball_gen_pos_x=35;
            ball_gen_pos_y=22;
            score1=score1+1;
            ball_gen_velo(2)= abs(-ball_gen_velo(2)+rand()/100);
            set(handles.text3,'string',num2str(score1));
            pause(0.5);
        end
                        %passing ball from bat 2
        
                
           if(score1==7)
               h=msgbox('player  1 won');
               pause(1)
               program=false;
               delete(handles.figure1);
           end
           
      %%%    block 4 end                
                        
      
      %%% bloack 5 moving ball
        if(fact==0)
        ball_gen_pos_x=ball_gen_pos_x + ball_gen_velo(1);
        ball_gen_pos_y=ball_gen_pos_y + ball_gen_velo(2);   % increading x & y position
      
        set(ball_define,'XData',ball_gen_pos_x,'YData',ball_gen_pos_y);
                                                 % set the new position and new
                                                 % data to the ball position
        end
        
       %%% block 5 end 
       
       
       %%%  bloack 6 moving bat 
       
               % for bat 01 _-------------------------------  
               if(bat_x1 >0 && bat_x2<80)                                          
                   bat_x1=bat_x1+increase_bat;
                   bat_x2=bat_x2+increase_bat;
                   set(bat_define,'XData',[bat_x1 bat_x2],'YData',[4 4]);
               elseif(increase_bat<0 && bat_x2>=80)
                   bat_x1=bat_x1+increase_bat;
                   bat_x2=bat_x2+increase_bat;
                   set(bat_define,'XData',[bat_x1 bat_x2],'YData',[4 4]);
               elseif(increase_bat>0 && bat_x1<=0)
                   bat_x1=bat_x1+increase_bat;
                   bat_x2=bat_x2+increase_bat;
                   set(bat_define,'XData',[bat_x1 bat_x2],'YData',[4 4]);
               end

             % for bat 02_------------------------------------
                if(bat2_x1 >0 && bat2_x2<80)                                          
                   bat2_x1=bat2_x1+increase_bat2;
                   bat2_x2=bat2_x2+increase_bat2;
                   set(bat2_define,'XData',[bat2_x1 bat2_x2],'YData',[96 96]);
               elseif(increase_bat2<0 && bat2_x2>=80)
                   bat2_x1=bat2_x1+increase_bat2;
                   bat2_x2=bat2_x2+increase_bat2;
                   set(bat2_define,'XData',[bat2_x1 bat2_x2],'YData',[96 96]);
               elseif(increase_bat2>0 && bat2_x1<=0)
                   bat2_x1=bat2_x1+increase_bat2;
                   bat2_x2=bat2_x2+increase_bat2;
                   set(bat2_define,'XData',[bat2_x1 bat2_x2],'YData',[96 96]);
                end
               
            %%%block 6 end
            
            %%% bloack 7  frame pause and level
            
                if(level==1) 
                 pause(0.024);
                 
                end 
                if(level==2)
                   
                   pause(0.018);
                  
                end
                if(level==3)
                    
                   pause(0.013);
                    
                end
                
              %%%block 7 end   
     
              
 end
 
 
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global increase_bat;
global increase_bat2;
global fact;
if(fact==0)
switch(eventdata.Key)
                    case 'leftarrow',  increase_bat = -.75; 
                    case 'rightarrow', increase_bat =  .75;
                    case 'a', increase_bat2=-0.75;
                    case 'd',  increase_bat2=0.75;
end

end  


% --- Executes on key release with focus on figure1 or any of its controls.
function figure1_WindowKeyReleaseFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was released, in lower case
%	Character: character interpretation of the key(s) that was released
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) released
% handles    structure with handles and user data (see GUIDATA)
global increase_bat;
global increase_bat2;
                 increase_bat = 0;
                 increase_bat2 = 0;
      
    function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
        %
        %
        

% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
global score1;

% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
     
      


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global score2;



% --- Executes on button press in pushExit.
function pushExit_Callback(hObject, eventdata, handles)
% hObject    handle to pushExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global program;
program=false;
clc;
delete(handles.figure1);
clear all;
close;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
 global level;

 level=get(handles.popupmenu1,'value');
 if(level==4)
     M=msgbox('Player "1" is controlled by leftarrow(<) and rightarrow(>) . Player 2 is controlled by key "a" & key "d"');
 end
 
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


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1
global fact;
fact=get(hObject,'Value');
