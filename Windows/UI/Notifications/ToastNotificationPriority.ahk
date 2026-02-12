#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the priority of a [ToastNotification](toastnotification.md).
 * @remarks
 * The priority setting provides hints on how and at what urgency level a notification should be presented to the user (whether to wake up the screen, etc).
 * Whether the notification is displayed in high priority is based on the state and power management policy of the device.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationpriority
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastNotificationPriority extends Win32Enum{

    /**
     * The notification should have default behavior in terms of delivery and display priority during connected standby mode.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The notification should be treated as high priority. For desktop PCs, this means during connected standby mode the incoming notification can turn on the screen for Surface-like devices if it doesn't have a closed lid detected.
     * @type {Integer (Int32)}
     */
    static High => 1
}
