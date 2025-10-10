#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CounterId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Attrib {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    DetailLevel {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Scale {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
