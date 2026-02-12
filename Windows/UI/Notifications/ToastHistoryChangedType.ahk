#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of change that has happened to a notification in toast history. Used with [ToastNotificationHistoryChangedTriggerDetail.ChangeType](toastnotificationhistorychangedtriggerdetail_changetype.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toasthistorychangedtype
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastHistoryChangedType extends Win32Enum{

    /**
     * One or more notifications were removed with a clear command.
     * @type {Integer (Int32)}
     */
    static Cleared => 0

    /**
     * Just this notification was removed with a remove command.
     * @type {Integer (Int32)}
     */
    static Removed => 1

    /**
     * The notification has expired.
     * @type {Integer (Int32)}
     */
    static Expired => 2

    /**
     * The notification was added.
     * @type {Integer (Int32)}
     */
    static Added => 3
}
