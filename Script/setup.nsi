; The name of the installer
Name "Touch"

; The file to write
OutFile "setup.exe"

; The default installation directory
InstallDir $PROGRAMFILES\Touch

;--------------------------------

; Pages

Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File Touch.exe 
  WriteUninstaller $INSTDIR\uninstall.exe
  
  ;Chave que adiciona o menu de contexto para qualquer arquivo
  WriteRegStr HKCR "*\shell\Touch\command" \
                   "" "$INSTDIR\touch.exe %1"
  
  ;Chaves do desinstalador
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Touch" \
                   "DisplayName" "Touch"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Touch" \
                   "Publisher" "github.com/devmartins"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Touch" \
                   "DisplayVersion" "1.0"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Touch" \
                     "EstimatedSize" 5
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Touch" \
                   "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
  
SectionEnd

Section "Uninstall"

  DeleteRegKey HKCR "*\shell\Touch"

  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Touch"

  SetOutPath $INSTDIR
  Delete Touch.exe
  Delete Uninstall.exe
  SetOutPath $PROGRAMFILES
  RMDir $INSTDIR
  
SectionEnd
