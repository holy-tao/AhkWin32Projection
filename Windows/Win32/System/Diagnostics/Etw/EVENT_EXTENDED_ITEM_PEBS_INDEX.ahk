#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_pebs_index
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_EXTENDED_ITEM_PEBS_INDEX {
    #StructPack 8

    /**
     * The PEBS index.
     */
    PebsIndex : Int64

}
