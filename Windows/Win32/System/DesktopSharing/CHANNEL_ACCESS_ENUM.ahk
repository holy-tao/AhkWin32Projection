#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the type of access granted to the attendee for the channel.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/ne-rdpencomapi-channel_access_enum
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class CHANNEL_ACCESS_ENUM extends Win32Enum{

    /**
     * No access. The attendee cannot send or receive data on the channel.
     * @type {Integer (Int32)}
     */
    static CHANNEL_ACCESS_ENUM_NONE => 0

    /**
     * The attendee can send or receive data on the channel.
     * @type {Integer (Int32)}
     */
    static CHANNEL_ACCESS_ENUM_SENDRECEIVE => 1
}
