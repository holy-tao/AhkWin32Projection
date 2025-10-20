#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Note  This structure is deprecated.  Contains information about an event that is raised when one or more windows closes.
 * @remarks
 * 
  * This event is raised for any window (HWND) that closes, not just top-level windows.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcoreapi/ns-uiautomationcoreapi-uiawindowclosedeventargs
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaWindowClosedEventArgs extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a> enumerated type indicating the type of event.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The event identifier. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @type {Integer}
     */
    EventId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int*</b>
     * 
     * The address of an array of the UI Automation runtime identifiers of windows that have closed.
     * @type {Pointer<Integer>}
     */
    pRuntimeId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The count of elements in the array.
     * @type {Integer}
     */
    cRuntimeIdLen {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
