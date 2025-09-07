#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify the event type described by a UiaEventArgs structure.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class EventArgsType{

    /**
     * A simple event that does not provide data in the event arguments.
     * @type {Integer (Int32)}
     */
    static EventArgsType_Simple => 0

    /**
     * An event raised by calling the [UiaRaiseAutomationPropertyChangedEvent function](nf-uiautomationcoreapi-uiaraiseautomationpropertychangedevent.md).
     * @type {Integer (Int32)}
     */
    static EventArgsType_PropertyChanged => 1

    /**
     * An event raised by calling the [UiaRaiseStructureChangedEvent function](nf-uiautomationcoreapi-uiaraisestructurechangedevent.md).
     * @type {Integer (Int32)}
     */
    static EventArgsType_StructureChanged => 2

    /**
     * An event raised by calling the [UiaRaiseAsyncContentLoadedEvent function](nf-uiautomationcoreapi-uiaraiseasynccontentloadedevent.md).
     * @type {Integer (Int32)}
     */
    static EventArgsType_AsyncContentLoaded => 3

    /**
     * An event raised when a window is closed.
     * @type {Integer (Int32)}
     */
    static EventArgsType_WindowClosed => 4

    /**
     * An event raised by calling the [UiaRaiseTextEditTextChangedEvent function](nf-uiautomationcoreapi-uiaraisetextedittextchangedevent.md)
     * @type {Integer (Int32)}
     */
    static EventArgsType_TextEditTextChanged => 5

    /**
     * An event raised by calling the [UiaRaiseChangesEvent function](nf-uiautomationcoreapi-uiaraisechangesevent.md).
     * @type {Integer (Int32)}
     */
    static EventArgsType_Changes => 6

    /**
     * An event raised by calling the [UiaRaiseNotificationEvent function](nf-uiautomationcoreapi-uiaraisenotificationevent.md).
     * @type {Integer (Int32)}
     */
    static EventArgsType_Notification => 7

    /**
     * An event raised by calling the [UiaRaiseActiveTextPositionChangedEvent function](nf-uiautomationcoreapi-uiaraiseactivetextpositionchangedevent.md).
     * @type {Integer (Int32)}
     */
    static EventArgsType_ActiveTextPositionChanged => 8

    /**
     * @type {Integer (Int32)}
     */
    static EventArgsType_StructuredMarkup => 9
}
