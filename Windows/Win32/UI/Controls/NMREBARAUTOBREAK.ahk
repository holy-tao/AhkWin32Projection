#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information used with the RBN_AUTOBREAK notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmrebarautobreak
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMREBARAUTOBREAK extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that provides additional information about this notification code.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index of the band affected by the notification. This is -1 if no band is affected.
     * @type {Integer}
     */
    uBand {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Application-defined ID of the band.
     * @type {Integer}
     */
    wID {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value from the <b>lParam</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-rebarbandinfoa">REBARBANDINFO</a> structure that defines the rebar band.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * ID of the message.
     * @type {Integer}
     */
    uMsg {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Style of the specified band.
     * @type {Integer}
     */
    fStyleCurrent {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>BOOL</b> that indicates whether a break should occur.
     * @type {Integer}
     */
    fAutoBreak {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
