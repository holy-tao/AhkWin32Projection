#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Note  This structure is deprecated.  Contains information about an event raised when content is being asynchronously loaded by a UI element.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcoreapi/ns-uiautomationcoreapi-uiaasynccontentloadedeventargs
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaAsyncContentLoadedEventArgs extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a> enumerated type indicating the type of the event.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The identifier of the event. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @type {Integer}
     */
    EventId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-asynccontentloadedstate">AsyncContentLoadedState</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-asynccontentloadedstate">AsyncContentLoadedState</a> enumerated type indicating the state of asynchronous loading.
     * @type {Integer}
     */
    AsyncContentLoadedState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>double</b>
     * 
     * The percentage of loading that has been completed.
     * @type {Float}
     */
    PercentComplete {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }
}
