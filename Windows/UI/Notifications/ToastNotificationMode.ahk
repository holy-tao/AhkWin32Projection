#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the notification mode, which determines the set of notifications that are shown to the user.
 * @remarks
 * This enumeration is used by the [ToastNotificationManagerForUser.NotificationMode](toastnotificationmanagerforuser_notificationmode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmode
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastNotificationMode extends Win32Enum{

    /**
     * All notifications are allowed, including push notifications and other types of system notifications.
     * @type {Integer (Int32)}
     */
    static Unrestricted => 0

    /**
     * Allows only notifications marked as “priority” to be displayed, which is similar to the Do Not Disturb mode in Windows 11, where only certain priority notifications are allowed to be displayed (e.g. notifications from important contacts or apps).
     * @type {Integer (Int32)}
     */
    static PriorityOnly => 1

    /**
     * Allows only alert-like notifications to be shown, meaning that any non-alarm notifications are suppressed.
     * @type {Integer (Int32)}
     */
    static AlarmsOnly => 2
}
