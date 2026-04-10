#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WIN32_MEMORY_NUMA_PERFORMANCE_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class WIN32_MEMORY_NUMA_PERFORMANCE_INFORMATION_OUTPUT extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    EntryCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {WIN32_MEMORY_NUMA_PERFORMANCE_ENTRY}
     */
    PerformanceEntries {
        get {
            if(!this.HasProp("__PerformanceEntriesProxyArray"))
                this.__PerformanceEntriesProxyArray := Win32FixedArray(this.ptr + 8, 1, WIN32_MEMORY_NUMA_PERFORMANCE_ENTRY, "")
            return this.__PerformanceEntriesProxyArray
        }
    }
}
