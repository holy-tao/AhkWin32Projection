#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains information about a notification message.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-nmhdr
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMHDR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A window handle to the control sending the message.
     * @type {HWND}
     */
    hwndFrom{
        get {
            if(!this.HasProp("__hwndFrom"))
                this.__hwndFrom := HWND(0, this)
            return this.__hwndFrom
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An identifier of the control sending the message.
     * @type {Pointer}
     */
    idFrom {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A notification code. This member can be one of the common notification codes (see Notifications under <a href="https://msdn.microsoft.com/c8e72ae9-7c71-465d-9a6b-07e7923d4a13">General Control Reference</a>), or it can be a control-specific notification code.
     * @type {Integer}
     */
    code {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
