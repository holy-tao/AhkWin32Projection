#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 */
class DEVICE_STATE extends Win32Enum {

    /**
     * Native name: DEVICE_STATE_ACTIVE
     * @type {Integer (UInt32)}
     */
    static ACTIVE => 1

    /**
     * Native name: DEVICE_STATE_DISABLED
     * @type {Integer (UInt32)}
     */
    static DISABLED => 2

    /**
     * Native name: DEVICE_STATE_NOTPRESENT
     * @type {Integer (UInt32)}
     */
    static NOTPRESENT => 4

    /**
     * Native name: DEVICE_STATE_UNPLUGGED
     * @type {Integer (UInt32)}
     */
    static UNPLUGGED => 8
}
