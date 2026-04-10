#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MEM_DEDICATED_ATTRIBUTE_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class MEMORY_PARTITION_DEDICATED_MEMORY_ATTRIBUTE extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {MEM_DEDICATED_ATTRIBUTE_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
