#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEKMSFUNCDESC extends Win32Struct
{
    static sizeof => 268

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    idLang {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwControl {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {String}
     */
    pwszDescription {
        get => StrGet(this.ptr + 12, 127, "UTF-16")
        set => StrPut(value, this.ptr + 12, 127, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 268
    }
}
