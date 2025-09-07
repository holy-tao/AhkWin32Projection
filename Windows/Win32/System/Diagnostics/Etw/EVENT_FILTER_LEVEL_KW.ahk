#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines event IDs used in an EVENT_FILTER_DESCRIPTOR structure for a stack walk level-keyword filter.
 * @see https://learn.microsoft.com/windows/win32/api/evntprov/ns-evntprov-event_filter_level_kw
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_FILTER_LEVEL_KW extends Win32Struct
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
     * **true** to filter the events matching the provided names in; **false** to
     * filter them out.
     * 
     * If set to **true**, the filtered events will have stacks collected.
     * @type {Integer}
     */
    FilterIn {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }
}
