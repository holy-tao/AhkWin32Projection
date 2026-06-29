#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_process_start_key
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_EXTENDED_ITEM_PROCESS_START_KEY {
    #StructPack 8

    /**
     * The trace flag.
     */
    ProcessStartKey : Int64

}
