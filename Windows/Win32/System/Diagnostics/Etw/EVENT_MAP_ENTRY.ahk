#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines a single value map entry.
 * @remarks
 * For maps defined in a manifest, the string will contain a space at the end of the string. For example, if the value is mapped to "Monday" in the manifest, the string is returned as "Monday ".
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-event_map_entry
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_MAP_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Offset from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_map_info">EVENT_MAP_INFO</a> structure to a null-terminated Unicode string that contains the string associated with the map value in <b>Value</b> or <b>InputOffset</b>.
     * @type {Integer}
     */
    OutputOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    InputOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
