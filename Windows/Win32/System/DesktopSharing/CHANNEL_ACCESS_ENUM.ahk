#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the type of access granted to the attendee for the channel.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-channel_access_enum
 * @namespace Windows.Win32.System.DesktopSharing
 */
class CHANNEL_ACCESS_ENUM extends Win32Enum {

    /**
     * No access. The attendee cannot send or receive data on the channel.
     * Native name: CHANNEL_ACCESS_ENUM_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The attendee can send or receive data on the channel.
     * Native name: CHANNEL_ACCESS_ENUM_SENDRECEIVE
     * @type {Integer (Int32)}
     */
    static SENDRECEIVE => 1
}
