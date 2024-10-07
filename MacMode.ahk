#Requires AutoHotkey v2.0

~#Left::return
~#Right::return

; Swaps command and control keys so copy and paste works like Mac
RCtrl::RWin
RWin::RCtrl
LCtrl::LWin
LWin::LCtrl

; Mac style text cursor movement
!Left::^Left
!Right::^Right
^Left::Home
^Right::End

; Ctrl tab -> Ctrl tab
#Tab::^Tab
; Command tab -> Alt tab
^Tab::!Tab

; Sorts out `~|\# keys
\:: Send "{U+0060}"
#::Send "{U+005C}"
!3::Send "{U+0023}"
+\::Send "{U+007E}"
+#::Send "{U+007C}"

; Fixes snipping tool
^+4::#+S

; Right ctrl now acts like the function key
>^F1::F1
>^F2::F2
>^F3::F3
>^F4::F4
>^F5::F5
>^F6::F6
>^F7::F7
>^F8::F8
>^F9::F9
>^F10::F10
>^F11::F11
>^F12::F12

; Fixes media keys
F7::Media_Prev
F8::Media_Play_Pause
F9::Media_Next
F10::Volume_Mute
F11::Volume_Down
F12::Volume_Up

; Switch windows using side mouse button unless in fullscreen mode (stops working in games)
XButton1:: {
    ; Get Width and Height of "A"ctive window
    WinGetPos ,,&W,&H, "A"
    ; MsgBox "" W " x " H " " A_ScreenWidth " x " A_ScreenHeight

    ; Sends windows + tab if width and height of window is less than monitor
    ; i.e: if we are not fullscreen
    if (H < A_ScreenHeight or W < A_ScreenWidth) {
        Send "#{TAB}"
    }
}