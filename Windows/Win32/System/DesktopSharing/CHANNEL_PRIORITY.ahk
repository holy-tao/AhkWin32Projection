#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the priority used to send packets on the channel.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/ne-rdpencomapi-channel_priority
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class CHANNEL_PRIORITY extends Win32Enum{

    /**
     * Send the packets at a low priority.
     * @type {Integer (Int32)}
     */
    static CHANNEL_PRIORITY_LO => 0

    /**
     * Send the packets at a medium priority.
     * @type {Integer (Int32)}
     */
    static CHANNEL_PRIORITY_MED => 1

    /**
     * Send the packets at a high priority.
     * @type {Integer (Int32)}
     */
    static CHANNEL_PRIORITY_HI => 2
}
