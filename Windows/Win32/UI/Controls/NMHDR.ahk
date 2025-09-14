#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a notification message. (NMHDR)
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-nmhdr
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
     * @type {Pointer<HWND>}
     */
    hwndFrom {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT_PTR</a></b>
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
     * A notification code. This member can be one of the common notification codes (see Notifications under <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-reference">General Control Reference</a>), or it can be a control-specific notification code.
     * @type {Integer}
     */
    code {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
