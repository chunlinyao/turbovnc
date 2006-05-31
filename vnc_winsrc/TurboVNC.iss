; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=TurboVNC
AppVerName=TurboVNC 0.3.1
AppVersion=0.3.1
AppPublisher=The VirtualGL Project
AppPublisherURL=http://VirtualGL.sourceforge.net
AppSupportURL=http://VirtualGL.sourceforge.net
AppUpdatesURL=http://VirtualGL.sourceforge.net
DefaultDirName={pf}\TurboVNC
DefaultGroupName=TurboVNC
AllowNoIcons=yes
;AlwaysCreateUninstallIcon=no
InfoBeforeFile=InstInfo.rtf
Compression=zip/9
WindowVisible=no
DisableStartupPrompt=yes
BackColor=clBlack
BackColor2=clBlue

ChangesAssociations=yes

[Components]
Name: "server"; Description: "TurboVNC Server"; Types: custom;
Name: "viewer"; Description: "TurboVNC Viewer"; Types: full compact custom;
;Name: "webdoc"; Description: "Web pages and documentation"; Types: full custom;

[Files]
Source: "WinVNC\Release\WinVNC.exe"; DestDir: "{app}"; CopyMode: alwaysoverwrite; Flags: restartreplace; Components: server
Source: "WinVNC\Release\VNCHooks.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite; Flags: restartreplace; Components: server
Source: "..\..\vgl\windows\vnc\bin\turbojpeg.dll"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "VNCViewer\Release\vncviewer.exe"; DestDir: "{app}"; CopyMode: alwaysoverwrite; Components: viewer
Source: "README-bin.txt"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "LICENCE.txt"; DestDir: "{app}"; CopyMode: alwaysoverwrite
Source: "TurboVNC.url"; DestDir: "{app}"; CopyMode: alwaysoverwrite
;Source: "Web\*"; DestDir: "{app}\Web"; CopyMode: alwaysoverwrite; Components: webdoc
;Source: "Web\images\*"; DestDir: "{app}\Web\images"; CopyMode: alwaysoverwrite; Components: webdoc
;Source: "Web\logo\*"; DestDir: "{app}\Web\logo"; CopyMode: alwaysoverwrite; Components: webdoc
;Source: "Web\doc\win32\*"; DestDir: "{app}\Web\doc\win32"; CopyMode: alwaysoverwrite; Components: webdoc
;Source: "Web\doc\java\*"; DestDir: "{app}\Web\doc\java"; CopyMode: alwaysoverwrite; Components: webdoc
;Source: "Web\doc\man\*"; DestDir: "{app}\Web\doc\man"; CopyMode: alwaysoverwrite; Components: webdoc
;Source: "Web\doc\unix\*"; DestDir: "{app}\Web\doc\unix"; CopyMode: alwaysoverwrite; Components: webdoc

[Icons]
Name: "{group}\Launch TurboVNC Server";               FileName: "{app}\WinVNC.exe";                                    WorkingDir: "{app}";     Components: server
Name: "{group}\Show About Box";                       FileName: "{app}\WinVNC.exe";    Parameters: "-about";           WorkingDir: "{app}";     Components: server
Name: "{group}\Show User Settings";                   FileName: "{app}\WinVNC.exe";    Parameters: "-settings";        WorkingDir: "{app}";     Components: server
Name: "{group}\TurboVNC Viewer";   FileName: "{app}\vncviewer.exe"; Parameters: ""; WorkingDir: "{app}"; Components: viewer
Name: "{group}\TurboVNC Viewer (Listen Mode)";        FileName: "{app}\vncviewer.exe"; Parameters: "-listen";          WorkingDir: "{app}";     Components: viewer
Name: "{group}\Administration\Install VNC Service";   FileName: "{app}\WinVNC.exe";    Parameters: "-install";         WorkingDir: "{app}";     Components: server
Name: "{group}\Administration\Remove VNC Service";    FileName: "{app}\WinVNC.exe";    Parameters: "-remove";          WorkingDir: "{app}";     Components: server
Name: "{group}\Administration\Run Service Helper";    FileName: "{app}\WinVNC.exe";    Parameters: "-servicehelper";   WorkingDir: "{app}";     Components: server
Name: "{group}\Administration\Show Default Settings"; FileName: "{app}\WinVNC.exe";    Parameters: "-defaultsettings"; WorkingDir: "{app}";     Components: server
;Name: "{group}\Documentation\About VNC and TurboVNC"; FileName: "{app}\Web\index.html";                                WorkingDir: "{app}\Web"; Components: webdoc
;Name: "{group}\Documentation\Installation and Getting Started"; FileName: "{app}\Web\winst.html";                      WorkingDir: "{app}\Web"; Components: webdoc
Name: "{group}\Documentation\Read Me";        FileName: "{app}\README-bin.txt";                                   WorkingDir: "{app}"
Name: "{group}\Documentation\Licensing Terms";        FileName: "{app}\LICENCE.txt";                                   WorkingDir: "{app}"
Name: "{group}\Documentation\TurboVNC Web Site";      FileName: "{app}\TurboVNC.url"
;Name: "{group}\Documentation\What's New (Detailed Log)"; FileName: "{app}\Web\changelog-win32.html";                   WorkingDir: "{app}\Web"; Components: webdoc
;Name: "{group}\Documentation\What's New (Summary)";   FileName: "{app}\Web\whatsnew.html";                             WorkingDir: "{app}\Web"; Components: webdoc

[Tasks]
Name: associate; Description: "&Associate .vnc files with TurboVNC Viewer"; GroupDescription: "File associations:"; Components: viewer
Name: installservice; Description: "&Register TurboVNC Server as a system service"; GroupDescription: "Server configuration:"; Components: server; Flags: unchecked
Name: startservice; Description: "&Start or restart TurboVNC service"; GroupDescription: "Server configuration:"; Components: server; Flags: unchecked; MinVersion: 0,1

[Registry]
Root: HKCR; Subkey: ".vnc"; ValueType: string; ValueName: ""; ValueData: "VncViewer.Config"; Flags: uninsdeletevalue; Tasks: associate
Root: HKCR; Subkey: "VncViewer.Config"; ValueType: string; ValueName: ""; ValueData: "VNCviewer Config File"; Flags: uninsdeletekey; Tasks: associate
Root: HKCR; Subkey: "VncViewer.Config\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\vncviewer.exe,0"; Tasks: associate
Root: HKCR; Subkey: "VncViewer.Config\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\vncviewer.exe"" -config ""%1"""; Tasks: associate

[Run]
Filename: "{app}\WinVNC.exe"; Parameters: "-reinstall"; Tasks: installservice
Filename: "net"; Parameters: "start WinVNC"; Tasks: startservice
Filename: "{app}\WinVNC.exe"; Parameters: "-servicehelper"; Tasks: startservice

