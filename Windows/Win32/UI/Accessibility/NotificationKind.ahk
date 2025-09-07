#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that indicate the type of a notification event, and a hint to the listener about the processing of the event.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-notificationkind
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class NotificationKind{

    /**
     * The current element and/or the container has had something added to it that should be presented to the user.
     * @type {Integer (Int32)}
     */
    static NotificationKind_ItemAdded => 0

    /**
     * The current element has had something removed from inside of it that should be presented to the user.
     * @type {Integer (Int32)}
     */
    static NotificationKind_ItemRemoved => 1

    /**
     * The current element has a notification that an action was completed.
     * @type {Integer (Int32)}
     */
    static NotificationKind_ActionCompleted => 2

    /**
     * The current element has a notification that an action was aborted.
     * @type {Integer (Int32)}
     */
    static NotificationKind_ActionAborted => 3

    /**
     * The current element has a notification not an add, remove, completed, or aborted action.
     * @type {Integer (Int32)}
     */
    static NotificationKind_Other => 4
}
