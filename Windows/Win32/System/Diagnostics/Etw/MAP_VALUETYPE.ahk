#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines if the value map value is in a ULONG data type or a string.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-map_valuetype
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct MAP_VALUETYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
