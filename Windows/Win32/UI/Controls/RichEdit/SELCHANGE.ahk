#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\NMHDR.ahk
#Include .\CHARRANGE.ahk

/**
 * Contains information associated with an EN_SELCHANGE notification code. A rich edit control sends this notification to its parent window when the current selection changes.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-selchange
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class SELCHANGE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Notification header.
     * @type {NMHDR}
     */
    nmhdr{
        get {
            if(!this.HasProp("__nmhdr"))
                this.__nmhdr := NMHDR(this.ptr + 0)
            return this.__nmhdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * New selection range.
     * @type {CHARRANGE}
     */
    chrg{
        get {
            if(!this.HasProp("__chrg"))
                this.__chrg := CHARRANGE(this.ptr + 24)
            return this.__chrg
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * @type {Integer}
     */
    seltyp {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }
}
