#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about a drag event. The pointer to DRAGLISTINFO is passed as the lParam parameter of the drag list message.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-draglistinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DRAGLISTINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    uNotification {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the drag list box.
     * @type {Pointer<Void>}
     */
    hWnd {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the current x- and y-coordinates of the mouse cursor.
     * @type {POINT}
     */
    ptCursor{
        get {
            if(!this.HasProp("__ptCursor"))
                this.__ptCursor := POINT(this.ptr + 16)
            return this.__ptCursor
        }
    }
}
