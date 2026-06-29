#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EventArgsType.ahk" { EventArgsType }

/**
 * Note  This structure is deprecated.  Contains information about an event that is raised when one or more windows closes.
 * @remarks
 * This event is raised for any window (HWND) that closes, not just top-level windows.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiawindowclosedeventargs
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaWindowClosedEventArgs {
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
     * The event identifier. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     */
    EventId : Int32

    /**
     * Type: <b>int*</b>
     * 
     * The address of an array of the UI Automation runtime identifiers of windows that have closed.
     */
    pRuntimeId : IntPtr

    /**
     * Type: <b>int</b>
     * 
     * The count of elements in the array.
     */
    cRuntimeIdLen : Int32

}
