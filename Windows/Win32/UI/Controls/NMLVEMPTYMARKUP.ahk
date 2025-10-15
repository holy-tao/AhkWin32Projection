#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information used with the LVN_GETEMPTYMARKUP notification code.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmlvemptymarkup
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLVEMPTYMARKUP extends Win32Struct
{
    static sizeof => 4200

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Info on the notification message.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a>[L_MAX_URL_LENGTH]</b>
     * 
     * Markup to display.
     * @type {String}
     */
    szMarkup {
        get => StrGet(this.ptr + 28, 2083, "UTF-16")
        set => StrPut(value, this.ptr + 28, 2083, "UTF-16")
    }
}
