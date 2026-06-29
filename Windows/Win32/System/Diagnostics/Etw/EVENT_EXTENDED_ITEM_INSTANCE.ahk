#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the relationship between events if TraceEventInstance was used to log related events.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_instance
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_EXTENDED_ITEM_INSTANCE {
    #StructPack 4

    /**
     * A unique transaction identifier that maps an event to a specific transaction.
     */
    InstanceId : UInt32

    /**
     * A unique transaction identifier of a parent event if you are mapping a hierarchical relationship.
     */
    ParentInstanceId : UInt32

    /**
     * A GUID that uniquely identifies the provider that logged the event referenced by the <b>ParentInstanceId</b> member.
     */
    ParentGuid : Guid

}
