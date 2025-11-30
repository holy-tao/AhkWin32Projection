#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class DEVICE_STATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STATE_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STATE_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STATE_NOTPRESENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STATE_UNPLUGGED => 8
}
