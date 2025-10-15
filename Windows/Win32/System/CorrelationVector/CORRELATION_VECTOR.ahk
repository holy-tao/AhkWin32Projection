#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * @namespace Windows.Win32.System.CorrelationVector
 * @version v4.0.30319
 */
class CORRELATION_VECTOR extends Win32Struct
{
    static sizeof => 260

    static packingSize => 2

    /**
     * @type {CHAR}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := CHAR(this.ptr + 0)
            return this.__Version
        }
    }

    /**
     * @type {String}
     */
    Vector {
        get => StrGet(this.ptr + 2, 128, "UTF-16")
        set => StrPut(value, this.ptr + 2, 128, "UTF-16")
    }
}
