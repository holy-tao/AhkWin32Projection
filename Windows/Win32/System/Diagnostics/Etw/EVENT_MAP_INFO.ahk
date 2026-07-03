#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EVENT_MAP_ENTRY.ahk" { EVENT_MAP_ENTRY }
#Import ".\MAP_FLAGS.ahk" { MAP_FLAGS }
#Import ".\MAP_VALUETYPE.ahk" { MAP_VALUETYPE }

/**
 * Defines the metadata about the event map.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-event_map_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_MAP_INFO {
    #StructPack 4

    /**
     * Offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the event map.
     */
    NameOffset : UInt32

    /**
     * Indicates if the map is a value map, bitmap, or pattern map. This member can contain one or more flag values. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-map_flags">MAP_FLAGS</a> enumeration.
     */
    Flag : MAP_FLAGS

    /**
     * Number of map entries in <b>MapEntryArray</b>.
     */
    EntryCount : UInt32

    MapEntryValueType : MAP_VALUETYPE

    /**
     * Array of map entries. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_map_entry">EVENT_MAP_ENTRY</a> structure.
     */
    MapEntryArray : EVENT_MAP_ENTRY[1]

    static __New() {
        DefineProp(this.Prototype, 'FormatStringOffset', { type: UInt32, offset: 12 })
        this.DeleteProp("__New")
    }
}
