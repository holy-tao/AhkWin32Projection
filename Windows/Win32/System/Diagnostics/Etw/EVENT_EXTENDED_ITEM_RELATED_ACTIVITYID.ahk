#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the parent event of this event.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_related_activityid
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_EXTENDED_ITEM_RELATED_ACTIVITYID {
    #StructPack 4

    /**
     * A GUID that uniquely identifies the parent activity to which this activity is related. The identifier is specified in the <i>RelatedActivityId</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nf-evntprov-eventwritetransfer">EventWriteTransfer</a> function.
     */
    RelatedActivityId : Guid

}
