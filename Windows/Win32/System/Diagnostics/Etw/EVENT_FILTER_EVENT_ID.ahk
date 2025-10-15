#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk

/**
 * Defines event IDs used in an EVENT_FILTER_DESCRIPTOR structure for an event ID or stack walk filter.
 * @remarks
 * 
  * The **EVENT_FILTER_EVENT_ID** structure is used in the
  * [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor)
  * structure when the **Type** member of the **EVENT_FILTER_DESCRIPTOR** is set to
  * **EVENT_FILTER_TYPE_EVENT_ID** or **EVENT_FILTER_TYPE_STACKWALK**. This
  * corresponds to an event ID filter (one of the possible scope filters) or a stack
  * walk filter. The **EVENT_FILTER_EVENT_ID** structure contains an array of event
  * IDs and a Boolean value that indicates if filtering is enabled or disabled for
  * the specified event IDs.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntprov/ns-evntprov-event_filter_event_id
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_FILTER_EVENT_ID extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * A value that indicates whether filtering should be enabled or disabled for the
     * event IDs passed in the **Events** member.
     * 
     * When this member is **TRUE**, filtering is enabled for the specified event IDs.
     * When this member is **FALSE**, filtering is disabled for the event IDs.
     * @type {BOOLEAN}
     */
    FilterIn{
        get {
            if(!this.HasProp("__FilterIn"))
                this.__FilterIn := BOOLEAN(this.ptr + 0)
            return this.__FilterIn
        }
    }

    /**
     * A reserved value.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The number of event IDs in the **Events** member.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * An array of event IDs.
     * @type {Array<UInt16>}
     */
    Events{
        get {
            if(!this.HasProp("__EventsProxyArray"))
                this.__EventsProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "ushort")
            return this.__EventsProxyArray
        }
    }
}
