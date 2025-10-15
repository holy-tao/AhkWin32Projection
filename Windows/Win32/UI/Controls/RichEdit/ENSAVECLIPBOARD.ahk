#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk

/**
 * Contains information about objects and text on the clipboard.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-ensaveclipboard
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ENSAVECLIPBOARD extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a> notification header.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Number of objects on the clipboard.
     * @type {Integer}
     */
    cObjectCount {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Number of characters on the clipboard.
     * @type {Integer}
     */
    cch {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
