#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EVENT_MAP_ENTRY.ahk

/**
 * Defines the metadata about the event map.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-event_map_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_MAP_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the event map.
     * @type {Integer}
     */
    NameOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates if the map is a value map, bitmap, or pattern map. This member can contain one or more flag values. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-map_flags">MAP_FLAGS</a> enumeration.
     * @type {Integer}
     */
    Flag {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Number of map entries in <b>MapEntryArray</b>.
     * @type {Integer}
     */
    EntryCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MapEntryValueType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    FormatStringOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Array of map entries. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_map_entry">EVENT_MAP_ENTRY</a> structure.
     * @type {Array<EVENT_MAP_ENTRY>}
     */
    MapEntryArray{
        get {
            if(!this.HasProp("__MapEntryArrayProxyArray"))
                this.__MapEntryArrayProxyArray := Win32FixedArray(this.ptr + 16, 8, EVENT_MAP_ENTRY, "")
            return this.__MapEntryArrayProxyArray
        }
    }
}
