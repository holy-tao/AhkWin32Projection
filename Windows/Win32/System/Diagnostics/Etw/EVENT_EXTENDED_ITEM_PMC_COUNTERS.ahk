#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_pmc_counters
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_EXTENDED_ITEM_PMC_COUNTERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Array<UInt64>}
     */
    Counter{
        get {
            if(!this.HasProp("__CounterProxyArray"))
                this.__CounterProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "uint")
            return this.__CounterProxyArray
        }
    }
}
