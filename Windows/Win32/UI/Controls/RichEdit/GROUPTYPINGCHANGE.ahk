#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class GROUPTYPINGCHANGE extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

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
     * @type {Integer}
     */
    fGroupTyping {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
