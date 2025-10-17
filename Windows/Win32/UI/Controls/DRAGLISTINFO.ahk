#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about a drag event. The pointer to DRAGLISTINFO is passed as the lParam parameter of the drag list message.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-draglistinfo
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
     * @type {HWND}
     */
    hWnd{
        get {
            if(!this.HasProp("__hWnd"))
                this.__hWnd := HWND(8, this)
            return this.__hWnd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that contains the current x- and y-coordinates of the mouse cursor.
     * @type {POINT}
     */
    ptCursor{
        get {
            if(!this.HasProp("__ptCursor"))
                this.__ptCursor := POINT(16, this)
            return this.__ptCursor
        }
    }
}
