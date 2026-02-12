#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationkinds
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class NotificationKinds extends Win32BitflagEnum{

    /**
     * The notification type is unknown.
     * @type {Integer (UInt32)}
     */
    static Unknown => 0

    /**
     * The notification is a toast notification.
     * @type {Integer (UInt32)}
     */
    static Toast => 1
}
