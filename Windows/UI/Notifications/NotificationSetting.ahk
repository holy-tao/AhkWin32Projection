#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the limitations on tile or toast notification display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationsetting
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class NotificationSetting extends Win32Enum{

    /**
     * All notifications raised by this app can be displayed.
     * @type {Integer (Int32)}
     */
    static Enabled => 0

    /**
     * The user has disabled notifications for this app.
     * @type {Integer (Int32)}
     */
    static DisabledForApplication => 1

    /**
     * The user or administrator has disabled all notifications for this user on this computer.
     * @type {Integer (Int32)}
     */
    static DisabledForUser => 2

    /**
     * An administrator has disabled all notifications on this computer through group policy. The group policy setting overrides the user's setting.
     * @type {Integer (Int32)}
     */
    static DisabledByGroupPolicy => 3

    /**
     * This app has not declared itself toast capable in its package.appxmanifest file. This setting is found on the manifest's Application UI page, under the Notification section. For an app to send toast, the **Toast Capable** option must be set to "Yes".
     * @type {Integer (Int32)}
     */
    static DisabledByManifest => 4
}
