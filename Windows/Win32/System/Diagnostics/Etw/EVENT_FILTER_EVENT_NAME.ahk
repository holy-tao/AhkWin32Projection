#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Defines event IDs used in an EVENT_FILTER_DESCRIPTOR structure for an event name or stalk walk name filter.
 * @see https://learn.microsoft.com/windows/win32/api/evntprov/ns-evntprov-event_filter_event_name
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_FILTER_EVENT_NAME {
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
     * **True** to filter the events matching the provided names in; **false** to
     * filter them out.
     * 
     * When used for the **EVENT_FILTER_TYPE_STACKWALK_NAME**filter type, the filtered
     * in events will have stacks collected for them.
     */
    FilterIn : BOOLEAN

    /**
     * The number of names in the **Names** member.
     */
    NameCount : UInt16

    /**
     * An **NameCount** long array of null-terminated, UTF-8 event names.
     */
    Names : Int8[1]

}
