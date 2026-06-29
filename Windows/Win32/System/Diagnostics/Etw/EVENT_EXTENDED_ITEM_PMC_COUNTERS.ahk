#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_pmc_counters
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_EXTENDED_ITEM_PMC_COUNTERS {
    #StructPack 8

    /**
     * The counter.
     */
    Counter : Int64[1]

}
