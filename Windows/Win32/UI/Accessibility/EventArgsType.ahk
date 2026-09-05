#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the event type described by a UiaEventArgs structure.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype
 * @namespace Windows.Win32.UI.Accessibility
 */
class EventArgsType extends Win32Enum {

    /**
     * A simple event that does not provide data in the event arguments.
     * Native name: EventArgsType_Simple
     * @type {Integer (Int32)}
     */
    static Simple => 0

    /**
     * An event raised by calling the [UiaRaiseAutomationPropertyChangedEvent function](nf-uiautomationcoreapi-uiaraiseautomationpropertychangedevent.md).
     * Native name: EventArgsType_PropertyChanged
     * @type {Integer (Int32)}
     */
    static PropertyChanged => 1

    /**
     * An event raised by calling the [UiaRaiseStructureChangedEvent function](nf-uiautomationcoreapi-uiaraisestructurechangedevent.md).
     * Native name: EventArgsType_StructureChanged
     * @type {Integer (Int32)}
     */
    static StructureChanged => 2

    /**
     * An event raised by calling the [UiaRaiseAsyncContentLoadedEvent function](nf-uiautomationcoreapi-uiaraiseasynccontentloadedevent.md).
     * Native name: EventArgsType_AsyncContentLoaded
     * @type {Integer (Int32)}
     */
    static AsyncContentLoaded => 3

    /**
     * An event raised when a window is closed.
     * Native name: EventArgsType_WindowClosed
     * @type {Integer (Int32)}
     */
    static WindowClosed => 4

    /**
     * An event raised by calling the [UiaRaiseTextEditTextChangedEvent function](nf-uiautomationcoreapi-uiaraisetextedittextchangedevent.md)
     * Native name: EventArgsType_TextEditTextChanged
     * @type {Integer (Int32)}
     */
    static TextEditTextChanged => 5

    /**
     * An event raised by calling the [UiaRaiseChangesEvent function](nf-uiautomationcoreapi-uiaraisechangesevent.md).
     * Native name: EventArgsType_Changes
     * @type {Integer (Int32)}
     */
    static Changes => 6

    /**
     * An event raised by calling the [UiaRaiseNotificationEvent function](nf-uiautomationcoreapi-uiaraisenotificationevent.md).
     * Native name: EventArgsType_Notification
     * @type {Integer (Int32)}
     */
    static Notification => 7

    /**
     * An event raised by calling the [UiaRaiseActiveTextPositionChangedEvent function](nf-uiautomationcoreapi-uiaraiseactivetextpositionchangedevent.md).
     * Native name: EventArgsType_ActiveTextPositionChanged
     * @type {Integer (Int32)}
     */
    static ActiveTextPositionChanged => 8

    /**
     * Native name: EventArgsType_StructuredMarkup
     * @type {Integer (Int32)}
     */
    static StructuredMarkup => 9
}
