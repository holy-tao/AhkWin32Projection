#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the user has given the [UserNotificationListener](usernotificationlistener.md) access to notifications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.management.usernotificationlisteneraccessstatus
 * @namespace Windows.UI.Notifications.Management
 * @version WindowsRuntime 1.4
 */
class UserNotificationListenerAccessStatus extends Win32Enum{

    /**
     * The user has not yet allowed or denied access.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The user granted access to the [UserNotificationListener](usernotificationlistener.md).
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * The user denied access to the [UserNotificationListener](usernotificationlistener.md).
     * @type {Integer (Int32)}
     */
    static Denied => 2
}
