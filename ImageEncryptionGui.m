%% Course: MULTIMEDIA SECURITY TECHNOLOGY
% Course Code: BIM33404
% LAB ASSIGNMENT 2: CRYPTOGRAPHY, VIRUS AND MALICIOUS CODE

% Original Author: busy

% Modified by: LEE ZI HUI (AI190244)

% GUI of the program
function varargout = ImageEncryptionGui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageEncryptionGui_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageEncryptionGui_OutputFcn, ...
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

% Executes just before the GUI is made visible
function ImageEncryptionGui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

clear all;
clc;

global Img;
global EncryptionImg;
global DecryptionImg;

% Outputs from this function are returned to the cmd line
function varargout = ImageEncryptionGui_OutputFcn(hObject, eventdata, handles) 
% Get the default cmd line output from the handles structure
varargout{1} = handles.output;

%% Handle the Upload Image button press and execute operation
function uploadImage_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Img;
global key;

x = uigetfile('*.jpg;*.tiff;*.png','Pick an image file'); % Open file selection window
Img = imread(x); % Read the selected image
axes(handles.axes1) % Set axes1 to be the current axes
imshow(Img); % Display the image to axes1
  
[n m k] = size(Img); % Spit the image
key = keyGen(n*m); % Generate the encryption key

guidata(hObject, handles);

%% Handle the Encryption button press and execute operation
function encryptImage_Callback(hObject, eventdata, handles)
global Img;
global EncryptionImg; 
global key;

EncryptionImg = imageProcess(Img,key); % Run the XOR encryption process
axes(handles.axes2); % Set the image to axes2
imshow(EncryptionImg); % Display the encrypted image 
imwrite(EncryptionImg,'results/Encoded.jpg','jpg'); % Write to the file explorer and save the encrypted image as Encoded.jpg image file

guidata(hObject, handles);

%% Handle the Decryption button press and execute operation
function decryptImage_Callback(hObject, eventdata, handles)
global DecryptionImg;
global EncryptionImg;
global key;

DecryptionImg = imageProcess(EncryptionImg,key); % Run the XOR decryption process
axes(handles.axes3); % Set the image to axes3
imshow(DecryptionImg); % Display the image
imwrite(DecryptionImg,'results/Decoded.jpg','jpg'); % Write to the file explorer and save the decrypted image as Decoded.jpg image file

guidata(hObject, handles);
