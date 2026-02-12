#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of notification when calling [RaiseNotificationEvent](automationpeer_raisenotificationevent_1452378292.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationnotificationkind
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationNotificationKind extends Win32Enum{

    /**
     * The current element container has had something added to it that should be presented to the user.
     * @type {Integer (Int32)}
     */
    static ItemAdded => 0

    /**
     * The current element has had something removed from inside it that should be presented to the user.
     * @type {Integer (Int32)}
     */
    static ItemRemoved => 1

    /**
     * The current element has a notification that an action was completed.
     * @type {Integer (Int32)}
     */
    static ActionCompleted => 2

    /**
     * The current element has a notification that an action was abandoned.
     * @type {Integer (Int32)}
     */
    static ActionAborted => 3

    /**
     * The current element has a notification not an add, remove, completed, or aborted action.
     * @type {Integer (Int32)}
     */
    static Other => 4
}
