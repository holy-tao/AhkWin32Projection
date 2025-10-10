#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines event IDs used in an EVENT_FILTER_DESCRIPTOR structure for an event name or stalk walk name filter.
 * @remarks
 * 
 * @see https://docs.microsoft.com/windows/win32/api//evntprov/ns-evntprov-event_filter_event_name
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_FILTER_EVENT_NAME extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Bitmask of keywords that determine the category of events to filter on.
     * @type {Integer}
     */
    MatchAnyKeyword {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This bitmask is optional. This mask further restricts the category of events
     * that you want to filter on. If the event's keyword meets the **MatchAnyKeyword**
     * condition, the provider will filter the event only if all of the bits in this
     * mask exist in the event's keyword. This mask is not used if **MatchAnyKeyword**
     * is zero.
     * @type {Integer}
     */
    MatchAllKeyword {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Defines the severity level of the event to filter on.
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * **True** to filter the events matching the provided names in; **false** to
     * filter them out.
     * 
     * When used for the **EVENT_FILTER_TYPE_STACKWALK_NAME**filter type, the filtered
     * in events will have stacks collected for them.
     * @type {Integer}
     */
    FilterIn {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * The number of names in the **Names** member.
     * @type {Integer}
     */
    NameCount {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * An **NameCount** long array of null-terminated, UTF-8 event names.
     * @type {Array<Byte>}
     */
    Names{
        get {
            if(!this.HasProp("__NamesProxyArray"))
                this.__NamesProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__NamesProxyArray
        }
    }
}
