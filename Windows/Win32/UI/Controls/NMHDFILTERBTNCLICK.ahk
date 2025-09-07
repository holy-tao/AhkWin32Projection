#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Specifies or receives the attributes of a filter button click.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmhdfilterbtnclick
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMHDFILTERBTNCLICK extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * A handle of an <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The zero-based index of the control to which this structure refers.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the client rectangle for the filter button.
     * @type {RECT}
     */
    rc{
        get {
            if(!this.HasProp("__rc"))
                this.__rc := RECT(this.ptr + 32)
            return this.__rc
        }
    }
}
