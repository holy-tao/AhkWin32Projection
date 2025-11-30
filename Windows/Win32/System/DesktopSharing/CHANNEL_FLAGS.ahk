#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for how data is sent on the channel.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/ne-rdpencomapi-channel_flags
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class CHANNEL_FLAGS extends Win32Enum{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static CHANNEL_FLAGS_LEGACY => 1

    /**
     * Data sent on the channel is not compressed. Use this option if the data is already compressed.
     * @type {Integer (Int32)}
     */
    static CHANNEL_FLAGS_UNCOMPRESSED => 2

    /**
     * @type {Integer (Int32)}
     */
    static CHANNEL_FLAGS_DYNAMIC => 4
}
