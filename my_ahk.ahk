#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Shift+Caps = Caps
+CapsLock::CapsLock

Capslock::Control  

; emacs style forward/back
!b::XButton1
!f::XButton2

; context menu is windows
AppsKey::LWin