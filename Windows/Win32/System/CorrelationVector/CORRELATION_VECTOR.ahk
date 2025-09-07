#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.CorrelationVector
 * @version v4.0.30319
 */
class CORRELATION_VECTOR extends Win32Struct
{
    static sizeof => 260

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {String}
     */
    Vector {
        get => StrGet(this.ptr + 2, 128, "UTF-16")
        set => StrPut(value, this.ptr + 2, 128, "UTF-16")
    }
}
