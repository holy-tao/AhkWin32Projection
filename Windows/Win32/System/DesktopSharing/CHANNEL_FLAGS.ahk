#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for how data is sent on the channel.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-channel_flags
 * @namespace Windows.Win32.System.DesktopSharing
 */
class CHANNEL_FLAGS extends Win32Enum {

    /**
     * Reserved.
     * Native name: CHANNEL_FLAGS_LEGACY
     * @type {Integer (Int32)}
     */
    static LEGACY => 1

    /**
     * Data sent on the channel is not compressed. Use this option if the data is already compressed.
     * Native name: CHANNEL_FLAGS_UNCOMPRESSED
     * @type {Integer (Int32)}
     */
    static UNCOMPRESSED => 2

    /**
     * Native name: CHANNEL_FLAGS_DYNAMIC
     * @type {Integer (Int32)}
     */
    static DYNAMIC => 4
}
