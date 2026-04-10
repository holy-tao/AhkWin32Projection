#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\ETW_PMC_COUNTER_OWNER_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class ETW_PMC_COUNTER_OWNER extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {ETW_PMC_COUNTER_OWNER_TYPE}
     */
    OwnerType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ProfileSource {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    OwnerTag {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
