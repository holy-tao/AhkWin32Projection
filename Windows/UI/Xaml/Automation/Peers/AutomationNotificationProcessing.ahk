#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the order in which to process a notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationnotificationprocessing
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationNotificationProcessing extends Win32Enum{

    /**
     * These notifications should be presented to the user as soon as possible. All of the notifications from this source should be delivered to the user.  
     *   
     * > [!WARNING]
     * > Use this in a limited capacity as this style of message could cause a flooding for information to the end user due to the nature of the request to deliver all of the notifications.
     * @type {Integer (Int32)}
     */
    static ImportantAll => 0

    /**
     * These notifications should be presented to the user as soon as possible. The most recent notifications from this source should be delivered to the user because the most recent notification supersedes all of the other notifications.
     * @type {Integer (Int32)}
     */
    static ImportantMostRecent => 1

    /**
     * These notifications should be presented to the user when possible. All of the notifications from this source should be delivered to the user.
     * @type {Integer (Int32)}
     */
    static All => 2

    /**
     * These notifications should be presented to the user when possible. Interrupt the current notification for this one.
     * @type {Integer (Int32)}
     */
    static MostRecent => 3

    /**
     * These notifications should be presented to the user when possible. Don’t interrupt the current notification for this one. If new notifications come in from the same source while the current notification is being presented, then keep the most recent and ignore the rest until the current processing is completed. Then use the most recent message as the current message.
     * @type {Integer (Int32)}
     */
    static CurrentThenMostRecent => 4
}
