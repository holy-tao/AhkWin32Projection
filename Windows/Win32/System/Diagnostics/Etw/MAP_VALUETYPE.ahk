#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines if the value map value is in a ULONG data type or a string.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-map_valuetype
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class MAP_VALUETYPE{

    /**
     * Use the <b>Value</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_map_entry">EVENT_MAP_ENTRY</a> to access the map value.
     * @type {Integer (Int32)}
     */
    static EVENTMAP_ENTRY_VALUETYPE_ULONG => 0

    /**
     * Use the <b>InputOffset</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_map_entry">EVENT_MAP_ENTRY</a> to access the map value.
     * @type {Integer (Int32)}
     */
    static EVENTMAP_ENTRY_VALUETYPE_STRING => 1
}
