#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the priority used to send packets on the channel.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-channel_priority
 * @namespace Windows.Win32.System.DesktopSharing
 */
class CHANNEL_PRIORITY extends Win32Enum {

    /**
     * Send the packets at a low priority.
     * Native name: CHANNEL_PRIORITY_LO
     * @type {Integer (Int32)}
     */
    static LO => 0

    /**
     * Send the packets at a medium priority.
     * Native name: CHANNEL_PRIORITY_MED
     * @type {Integer (Int32)}
     */
    static MED => 1

    /**
     * Send the packets at a high priority.
     * Native name: CHANNEL_PRIORITY_HI
     * @type {Integer (Int32)}
     */
    static HI => 2
}
