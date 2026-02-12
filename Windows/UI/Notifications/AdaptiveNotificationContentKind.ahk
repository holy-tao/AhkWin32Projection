#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of content contained in the adaptive notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.adaptivenotificationcontentkind
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class AdaptiveNotificationContentKind extends Win32Enum{

    /**
     * Text content.
     * @type {Integer (Int32)}
     */
    static Text => 0
}
