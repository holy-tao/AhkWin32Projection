#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk
#Include .\MOUSEHOOKSTRUCT.ahk

/**
 * Contains information about a mouse event passed to a WH_MOUSE hook procedure, MouseProc. This is an extension of the MOUSEHOOKSTRUCT structure that includes information about wheel movement or the use of the X button.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-mousehookstructex
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MOUSEHOOKSTRUCTEX extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {MOUSEHOOKSTRUCT}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := MOUSEHOOKSTRUCT(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * If the message is <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousewheel">WM_MOUSEWHEEL</a>, the HIWORD of this member is the wheel delta. The LOWORD is undefined and reserved. A positive value indicates that the wheel was rotated forward, away from the user; a negative value indicates that the wheel was rotated backward, toward the user. One wheel click is defined as WHEEL_DELTA, which is 120. 
     * 
     * If the message is <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-xbuttondown">WM_XBUTTONDOWN</a>, <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-xbuttonup">WM_XBUTTONUP</a>, <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-xbuttondblclk">WM_XBUTTONDBLCLK</a>, <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-ncxbuttondown">WM_NCXBUTTONDOWN</a>, <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-ncxbuttonup">WM_NCXBUTTONUP</a>, or <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-ncxbuttondblclk">WM_NCXBUTTONDBLCLK</a>, the HIWORD of
     * @type {Integer}
     */
    mouseData {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
