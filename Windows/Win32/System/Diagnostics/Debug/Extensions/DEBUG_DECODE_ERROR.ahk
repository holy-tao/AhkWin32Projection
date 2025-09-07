#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_DECODE_ERROR extends Win32Struct
{
    static sizeof => 660

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TreatAsStatus {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {String}
     */
    Source {
        get => StrGet(this.ptr + 12, 63, "UTF-16")
        set => StrPut(value, this.ptr + 12, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    Message {
        get => StrGet(this.ptr + 140, 259, "UTF-16")
        set => StrPut(value, this.ptr + 140, 259, "UTF-16")
    }
}
