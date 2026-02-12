#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether notification mirroring is allowed. Mirroring enables a notification to be displayed on multiple devices.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationmirroring
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class NotificationMirroring extends Win32Enum{

    /**
     * Notification mirroring is allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 0

    /**
     * Notification mirroring is disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 1
}
