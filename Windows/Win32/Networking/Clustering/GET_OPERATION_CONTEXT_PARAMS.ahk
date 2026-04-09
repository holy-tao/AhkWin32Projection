#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RESDLL_CONTEXT_OPERATION_TYPE.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class GET_OPERATION_CONTEXT_PARAMS extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {RESDLL_CONTEXT_OPERATION_TYPE}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
