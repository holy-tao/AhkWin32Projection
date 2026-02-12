#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the results of a notification update.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationupdateresult
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class NotificationUpdateResult extends Win32Enum{

    /**
     * The notification was updated.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The notification update failed.
     * @type {Integer (Int32)}
     */
    static Failed => 1

    /**
     * The specified notification couldn't be found.
     * @type {Integer (Int32)}
     */
    static NotificationNotFound => 2
}
