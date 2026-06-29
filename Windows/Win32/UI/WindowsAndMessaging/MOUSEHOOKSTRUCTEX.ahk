#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\MOUSEHOOKSTRUCT.ahk" { MOUSEHOOKSTRUCT }

/**
 * Contains information about a mouse event passed to a WH_MOUSE hook procedure, MouseProc. This is an extension of the MOUSEHOOKSTRUCT structure that includes information about wheel movement or the use of the X button.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-mousehookstructex
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MOUSEHOOKSTRUCTEX {
    #StructPack 8

    Base : MOUSEHOOKSTRUCT

    /**
     * Type: <b>DWORD</b>
     * 
     * If the message is <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousewheel">WM_MOUSEWHEEL</a>, the HIWORD of this member is the wheel delta. The LOWORD is undefined and reserved. A positive value indicates that the wheel was rotated forward, away from the user; a negative value indicates that the wheel was rotated backward, toward the user. One wheel click is defined as WHEEL_DELTA, which is 120. 
     * 
     * If the message is <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-xbuttondown">WM_XBUTTONDOWN</a>, <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-xbuttonup">WM_XBUTTONUP</a>, <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-xbuttondblclk">WM_XBUTTONDBLCLK</a>, <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-ncxbuttondown">WM_NCXBUTTONDOWN</a>, <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-ncxbuttonup">WM_NCXBUTTONUP</a>, or <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-ncxbuttondblclk">WM_NCXBUTTONDBLCLK</a>, the HIWORD of
     */
    mouseData : UInt32

}
