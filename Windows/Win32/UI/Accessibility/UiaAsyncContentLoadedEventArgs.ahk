#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EventArgsType.ahk" { EventArgsType }
#Import ".\AsyncContentLoadedState.ahk" { AsyncContentLoadedState }

/**
 * Note  This structure is deprecated.  Contains information about an event raised when content is being asynchronously loaded by a UI element.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiaasynccontentloadedeventargs
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaAsyncContentLoadedEventArgs {
    #StructPack 8

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

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-asynccontentloadedstate">AsyncContentLoadedState</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-asynccontentloadedstate">AsyncContentLoadedState</a> enumerated type indicating the state of asynchronous loading.
     */
    AsyncContentLoadedState : AsyncContentLoadedState

    /**
     * Type: <b>double</b>
     * 
     * The percentage of loading that has been completed.
     */
    PercentComplete : Float64

}
