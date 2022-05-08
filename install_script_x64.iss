;InnoSetupVersion=5.5.7 (Unicode)

[Setup]
AppName=RW-Everything
AppVerName=RW-Everything v1.7
AppId=RW-Everything
DefaultDirName={pf}\RW-Everything
DefaultGroupName=RW-Everything
UninstallDisplayIcon={app}\RW.exe
OutputBaseFilename=SetupRwX64
Compression=lzma
ArchitecturesInstallIn64BitMode=x64
DisableDirPage=auto
DisableProgramGroupPage=auto
WizardImageFile=embedded\WizardImage0.bmp
WizardSmallImageFile=embedded\WizardSmallImage0.bmp

[Files]
Source: "{app}\Rw.exe"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\Rw.ini"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\Rw.chm"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\RwWeb.url"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\25308086.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\ATA.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\ATAPI.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\DDR2SPD.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\DDR3SPD.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\DDRSPD.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\PCIBRI.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\PCISTD.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\SDRSPD.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 
Source: "{app}\W697HF0.IRW"; DestDir: "{app}"; MinVersion: 0.0,5.0; 

[Run]
Filename: "{app}\Rw.exe"; Description: "Launch RW-Everything"; MinVersion: 0.0,5.0; Flags: postinstall skipifsilent nowait

[UninstallRun]
Filename: "{app}\Rw.exe"; Parameters: "/Uninstall"; MinVersion: 0.0,5.0; 

[Icons]
Name: "{group}\RW-Everything"; Filename: "{app}\Rw.exe"; MinVersion: 0.0,5.0; 
Name: "{group}\RW-Everything on the Web"; Filename: "{app}\RwWeb.url"; MinVersion: 0.0,5.0; 
Name: "{group}\Uninstall RW-Everything"; Filename: "{uninstallexe}"; MinVersion: 0.0,5.0; 
Name: "{commondesktop}\RW-Everything"; Filename: "{app}\Rw.exe"; MinVersion: 0.0,5.0; 

[UninstallDelete]
Type: files; Name: "{app}\RwDebug.rw"; 
Type: files; Name: "{app}\AcpiTbls.bin"; 

[CustomMessages]
default.NameAndVersion=%1 version %2
default.AdditionalIcons=Additional shortcuts:
default.CreateDesktopIcon=Create a &desktop shortcut
default.CreateQuickLaunchIcon=Create a &Quick Launch shortcut
default.ProgramOnTheWeb=%1 on the Web
default.UninstallProgram=Uninstall %1
default.LaunchProgram=Launch %1
default.AssocFileExtension=&Associate %1 with the %2 file extension
default.AssocingFileExtension=Associating %1 with the %2 file extension...
default.AutoStartProgramGroupDescription=Startup:
default.AutoStartProgram=Automatically start %1
default.AddonHostProgramNotFound=%1 could not be located in the folder you selected.%n%nDo you want to continue anyway?

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "default"; MessagesFile: "embedded\default.isl"; 
