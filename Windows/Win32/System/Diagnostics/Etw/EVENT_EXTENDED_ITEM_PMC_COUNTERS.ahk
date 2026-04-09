#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_pmc_counters
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class EVENT_EXTENDED_ITEM_PMC_COUNTERS extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * The counter.
     * @type {Array<Integer>}
     */
    Counter {
        get {
            if(!this.HasProp("__CounterProxyArray"))
                this.__CounterProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
            return this.__CounterProxyArray
        }
    }
}
