#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class XID extends Win32Struct
{
    static sizeof => 268

    static packingSize => 4

    /**
     * @type {Integer}
     */
    formatID {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    gtrid_length {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    bqual_length {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {String}
     */
    data {
        get => StrGet(this.ptr + 12, 127, "UTF-16")
        set => StrPut(value, this.ptr + 12, 127, "UTF-16")
    }
}
