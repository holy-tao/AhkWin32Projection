#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class CARET_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HBITMAP}
     */
    hbitmap{
        get {
            if(!this.HasProp("__hbitmap"))
                this.__hbitmap := HBITMAP(0, this)
            return this.__hbitmap
        }
    }

    /**
     * @type {Integer}
     */
    caretFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
