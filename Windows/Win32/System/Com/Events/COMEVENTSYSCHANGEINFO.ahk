#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EOC_ChangeType.ahk" { EOC_ChangeType }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * Represents a system event structure, which contains the partition and application ID from which an event originated.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/ns-eventsys-comeventsyschangeinfo
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct COMEVENTSYSCHANGEINFO {
    #StructPack 8

    /**
     * The size of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The type of change that has been made to the subscription. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/ne-eventsys-eoc_changetype">EOC_ChangeType</a>.
     */
    changeType : EOC_ChangeType

    /**
     * The EventClass ID or subscription ID from which the change impacts.
     */
    objectId : BSTR

    /**
     * The EventClass partition ID or the subscriber partition ID affected.
     */
    partitionId : BSTR

    /**
     * The EventClass application ID or subscriber application ID affected.
     */
    applicationId : BSTR

    /**
     * This member is reserved.
     */
    reserved : IntPtr[10]

}
