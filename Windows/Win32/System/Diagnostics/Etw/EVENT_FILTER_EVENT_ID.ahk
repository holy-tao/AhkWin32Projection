#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Defines event IDs used in an EVENT_FILTER_DESCRIPTOR structure for an event ID or stack walk filter.
 * @remarks
 * The **EVENT_FILTER_EVENT_ID** structure is used in the
 * [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor)
 * structure when the **Type** member of the **EVENT_FILTER_DESCRIPTOR** is set to
 * **EVENT_FILTER_TYPE_EVENT_ID** or **EVENT_FILTER_TYPE_STACKWALK**. This
 * corresponds to an event ID filter (one of the possible scope filters) or a stack
 * walk filter. The **EVENT_FILTER_EVENT_ID** structure contains an array of event
 * IDs and a Boolean value that indicates if filtering is enabled or disabled for
 * the specified event IDs.
 * @see https://learn.microsoft.com/windows/win32/api/evntprov/ns-evntprov-event_filter_event_id
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_FILTER_EVENT_ID {
    #StructPack 2

    /**
     * A value that indicates whether filtering should be enabled or disabled for the
     * event IDs passed in the **Events** member.
     * 
     * When this member is **TRUE**, filtering is enabled for the specified event IDs.
     * When this member is **FALSE**, filtering is disabled for the event IDs.
     */
    FilterIn : BOOLEAN

    /**
     * A reserved value.
     */
    Reserved : Int8

    /**
     * The number of event IDs in the **Events** member.
     */
    Count : UInt16

    /**
     * An array of event IDs.
     */
    Events : UInt16[1]

}
