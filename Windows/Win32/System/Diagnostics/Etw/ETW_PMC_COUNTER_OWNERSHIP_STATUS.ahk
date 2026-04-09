#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\ETW_PMC_COUNTER_OWNER.ahk
#Include .\ETW_PMC_COUNTER_OWNER_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class ETW_PMC_COUNTER_OWNERSHIP_STATUS extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ProcessorNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberOfCounters {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {ETW_PMC_COUNTER_OWNER}
     */
    CounterOwners {
        get {
            if(!this.HasProp("__CounterOwnersProxyArray"))
                this.__CounterOwnersProxyArray := Win32FixedArray(this.ptr + 8, 1, ETW_PMC_COUNTER_OWNER, "")
            return this.__CounterOwnersProxyArray
        }
    }
}
