#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains and receives information that the pager control uses to calculate the scrollable area of the contained window. It is used with the PGN_CALCSIZE notification.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmpgcalcsize
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMPGCALCSIZE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification.
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
    dwFlag {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Receives the desired width of the scrollable area, in pixels.
     * @type {Integer}
     */
    iWidth {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b>int</b>
     * 
     * Receives the desired height of the scrollable area, in pixels.
     * @type {Integer}
     */
    iHeight {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
