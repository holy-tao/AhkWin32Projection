#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.CorrelationVector
 */
class CORRELATION_VECTOR extends Win32Struct {
    static sizeof => 132

    static packingSize => 2

    /**
     * @type {CHAR}
     */
    Version {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {String}
     */
    Vector {
        get => StrGet(this.ptr + 2, 128, "UTF-8")
        set => StrPut(value, this.ptr + 2, 128, "UTF-8")
    }
}
