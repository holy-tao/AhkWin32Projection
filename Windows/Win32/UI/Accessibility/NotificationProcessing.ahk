#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate how a notification should be processed.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-notificationprocessing
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class NotificationProcessing extends Win32Enum{

    /**
     * These notifications should be presented to the user as soon as possible and 
     * all of the notifications from this source should be delivered to the user.
     * 
     * <div class="alert"><b>Warning</b>  Use this in a limited capacity as this style of message could cause a flooding of information to the user due to the nature of the request to deliver all notifications.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static NotificationProcessing_ImportantAll => 0

    /**
     * These notifications 
     * should be presented to the user as soon as possible. The most recent notification from this source should be delivered to the user because it supersedes all of the other notifications.
     * @type {Integer (Int32)}
     */
    static NotificationProcessing_ImportantMostRecent => 1

    /**
     * These notifications 
     * should be presented to the user when possible. 
     * All of the notifications from this source should be delivered to the user.
     * @type {Integer (Int32)}
     */
    static NotificationProcessing_All => 2

    /**
     * These notifications 
     * should be presented to the user when possible. The most recent notification from this source should be delivered to the user because it supersedes all of the other notifications.
     * @type {Integer (Int32)}
     */
    static NotificationProcessing_MostRecent => 3

    /**
     * These notifications 
     * should be presented to the user when possible. 
     * Don’t interrupt the current notification for this one.
     * If new notifications come in from the same source while the current notification is being presented, keep the most recent and ignore the rest until the current processing is completed.  Then, use the most recent message as the current message.
     * @type {Integer (Int32)}
     */
    static NotificationProcessing_CurrentThenMostRecent => 4

    /**
     * @type {Integer (Int32)}
     */
    static NotificationProcessing_ImportantCurrentThenMostRecent => 5
}
