#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\ETW_PMC_COUNTER_OWNER.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_PMC_COUNTER_OWNERSHIP_STATUS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
     * @type {Array<ETW_PMC_COUNTER_OWNER>}
     */
    CounterOwners{
        get {
            if(!this.HasProp("__CounterOwnersProxyArray"))
                this.__CounterOwnersProxyArray := Win32FixedArray(this.ptr + 8, 1, ETW_PMC_COUNTER_OWNER, "")
            return this.__CounterOwnersProxyArray
        }
    }
}
