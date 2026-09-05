#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the type of a notification event, and a hint to the listener about the processing of the event.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-notificationkind
 * @namespace Windows.Win32.UI.Accessibility
 */
class NotificationKind extends Win32Enum {

    /**
     * The current element and/or the container has had something added to it that should be presented to the user.
     * Native name: NotificationKind_ItemAdded
     * @type {Integer (Int32)}
     */
    static ItemAdded => 0

    /**
     * The current element has had something removed from inside of it that should be presented to the user.
     * Native name: NotificationKind_ItemRemoved
     * @type {Integer (Int32)}
     */
    static ItemRemoved => 1

    /**
     * The current element has a notification that an action was completed.
     * Native name: NotificationKind_ActionCompleted
     * @type {Integer (Int32)}
     */
    static ActionCompleted => 2

    /**
     * The current element has a notification that an action was aborted.
     * Native name: NotificationKind_ActionAborted
     * @type {Integer (Int32)}
     */
    static ActionAborted => 3

    /**
     * The current element has a notification not an add, remove, completed, or aborted action.
     * Native name: NotificationKind_Other
     * @type {Integer (Int32)}
     */
    static Other => 4
}
