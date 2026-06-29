#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EventArgsType.ahk" { EventArgsType }

/**
 * Note  This structure is deprecated.  Contains information about a Microsoft UI Automation event.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiaeventargs
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaEventArgs {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a> enumerated type indicating the type of the event.
     */
    Type : EventArgsType

    /**
     * Type: <b>int</b>
     * 
     * The identifier of the event. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     */
    EventId : Int32

}
