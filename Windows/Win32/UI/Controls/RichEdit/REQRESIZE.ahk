#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk
#Include ..\..\..\Foundation\RECT.ahk

/**
 * Contains the requested size of a rich edit control. A rich edit control sends this structure to its parent window as part of an EN_REQUESTRESIZE notification code.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-reqresize
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class REQRESIZE extends Win32Struct
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
                this.__nmhdr := NMHDR(0, this)
            return this.__nmhdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * Requested new size.
     * @type {RECT}
     */
    rc{
        get {
            if(!this.HasProp("__rc"))
                this.__rc := RECT(24, this)
            return this.__rc
        }
    }
}
