#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class FDISPILLFILE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {String}
     */
    ach {
        get => StrGet(this.ptr + 0, 1, "UTF-16")
        set => StrPut(value, this.ptr + 0, 1, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    cbFile {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
