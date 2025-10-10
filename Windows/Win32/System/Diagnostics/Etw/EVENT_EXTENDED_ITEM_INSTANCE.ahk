#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the relationship between events if TraceEventInstance was used to log related events.
 * @see https://docs.microsoft.com/windows/win32/api//evntcons/ns-evntcons-event_extended_item_instance
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_EXTENDED_ITEM_INSTANCE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A unique transaction identifier that maps an event to a specific transaction.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A unique transaction identifier of a parent event if you are mapping a hierarchical relationship.
     * @type {Integer}
     */
    ParentInstanceId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A GUID that uniquely identifies the provider that logged the event referenced by the <b>ParentInstanceId</b> member.
     * @type {Pointer<Guid>}
     */
    ParentGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
