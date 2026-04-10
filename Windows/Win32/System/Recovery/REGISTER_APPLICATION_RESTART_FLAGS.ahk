#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Recovery
 */
class REGISTER_APPLICATION_RESTART_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static RESTART_NO_CRASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESTART_NO_HANG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESTART_NO_PATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RESTART_NO_REBOOT => 8
}
