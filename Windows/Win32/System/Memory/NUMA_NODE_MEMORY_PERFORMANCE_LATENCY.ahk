#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NUMA_NODE_MEMORY_PERFORMANCE_MEASUREMENT_CONDITION.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class NUMA_NODE_MEMORY_PERFORMANCE_LATENCY extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {NUMA_NODE_MEMORY_PERFORMANCE_MEASUREMENT_CONDITION}
     */
    Condition {
        get {
            if(!this.HasProp("__Condition"))
                this.__Condition := NUMA_NODE_MEMORY_PERFORMANCE_MEASUREMENT_CONDITION(0, this)
            return this.__Condition
        }
    }

    /**
     * @type {Integer}
     */
    Latency {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
