#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMTBHOTITEM_FLAGS.ahk

/**
 * Contains information about the movement of the mouse over a button control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmbchotitem
 * @namespace Windows.Win32.UI.Controls
 */
class NMBCHOTITEM extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure.
     * @type {NMHDR}
     */
    hdr {
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(0, this)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {NMTBHOTITEM_FLAGS}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
