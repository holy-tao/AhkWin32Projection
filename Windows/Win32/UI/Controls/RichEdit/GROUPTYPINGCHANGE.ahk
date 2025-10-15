#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class GROUPTYPINGCHANGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
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
     * @type {BOOL}
     */
    fGroupTyping{
        get {
            if(!this.HasProp("__fGroupTyping"))
                this.__fGroupTyping := BOOL(this.ptr + 24)
            return this.__fGroupTyping
        }
    }
}
