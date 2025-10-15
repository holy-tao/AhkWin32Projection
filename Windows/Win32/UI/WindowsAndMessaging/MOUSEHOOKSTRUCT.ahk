#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains information about a mouse event passed to a WH_MOUSE hook procedure, MouseProc.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-mousehookstruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MOUSEHOOKSTRUCT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * The x- and y-coordinates of the cursor, in screen coordinates.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(this.ptr + 0)
            return this.__pt
        }
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that will receive the mouse message corresponding to the mouse event.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 8)
            return this.__hwnd
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The hit-test value. For a list of hit-test values, see the description of the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-nchittest">WM_NCHITTEST</a> message.
     * @type {Integer}
     */
    wHitTestCode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional information associated with the message.
     * @type {Pointer}
     */
    dwExtraInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
