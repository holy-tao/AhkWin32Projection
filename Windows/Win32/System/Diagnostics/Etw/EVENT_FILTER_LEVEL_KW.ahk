#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Defines event IDs used in an EVENT_FILTER_DESCRIPTOR structure for a stack walk level-keyword filter.
 * @see https://learn.microsoft.com/windows/win32/api/evntprov/ns-evntprov-event_filter_level_kw
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_FILTER_LEVEL_KW {
    #StructPack 8

    /**
     * Bitmask of keywords that determine the category of events to filter on.
     */
    MatchAnyKeyword : Int64

    /**
     * This bitmask is optional. This mask further restricts the category of events
     * that you want to filter on. If the event's keyword meets the **MatchAnyKeyword**
     * condition, the provider will filter the event only if all of the bits in this
     * mask exist in the event's keyword. This mask is not used if **MatchAnyKeyword**
     * is zero.
     */
    MatchAllKeyword : Int64

    /**
     * Defines the severity level of the event to filter on.
     */
    Level : Int8

    /**
     * **true** to filter the events matching the provided names in; **false** to
     * filter them out.
     * 
     * If set to **true**, the filtered events will have stacks collected.
     */
    FilterIn : BOOLEAN

}
