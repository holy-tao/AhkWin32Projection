#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EventArgsType.ahk" { EventArgsType }
#Import ".\StructureChangeType.ahk" { StructureChangeType }

/**
 * Note  This structure is deprecated.  Contains information about an event that is raised when the structure of the Microsoft UI Automation tree changes.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiastructurechangedeventargs
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaStructureChangedEventArgs {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a> enumerated type indicating the type of event.
     */
    Type : EventArgsType

    /**
     * Type: <b>int</b>
     * 
     * The identifier of the event. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     */
    EventId : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-structurechangetype">StructureChangeType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-structurechangetype">StructureChangeType</a> enumerated type indicating the type of change that has taken place.
     */
    StructureChangeType : StructureChangeType

    /**
     * Type: <b>int*</b>
     * 
     * The address of an array of runtime identifiers for elements involved in the change.
     */
    pRuntimeId : IntPtr

    /**
     * Type: <b>int</b>
     * 
     * The count of elements in the array.
     */
    cRuntimeIdLen : Int32

}
