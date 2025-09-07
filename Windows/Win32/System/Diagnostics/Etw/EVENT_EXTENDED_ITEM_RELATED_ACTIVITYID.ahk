#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the parent event of this event.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_related_activityid
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_EXTENDED_ITEM_RELATED_ACTIVITYID extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A GUID that uniquely identifies the parent activity to which this activity is related. The identifier is specified in the <i>RelatedActivityId</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nf-evntprov-eventwritetransfer">EventWriteTransfer</a> function.
     * @type {Pointer<Guid>}
     */
    RelatedActivityId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
