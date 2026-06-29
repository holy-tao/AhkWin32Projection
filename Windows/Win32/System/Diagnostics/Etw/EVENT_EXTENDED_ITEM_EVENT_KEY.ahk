#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_event_key
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_EXTENDED_ITEM_EVENT_KEY {
    #StructPack 8

    /**
     * The event key.
     */
    Key : Int64

}
