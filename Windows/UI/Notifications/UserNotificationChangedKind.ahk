#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of user notification change that occurred.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.usernotificationchangedkind
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class UserNotificationChangedKind extends Win32Enum{

    /**
     * The user notification was added.
     * @type {Integer (Int32)}
     */
    static Added => 0

    /**
     * The user notification was removed.
     * @type {Integer (Int32)}
     */
    static Removed => 1
}
