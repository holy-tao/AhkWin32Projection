#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Recovery
 */
class REGISTER_APPLICATION_RESTART_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: RESTART_NO_CRASH
     * @type {Integer (UInt32)}
     */
    static NO_CRASH => 1

    /**
     * Native name: RESTART_NO_HANG
     * @type {Integer (UInt32)}
     */
    static NO_HANG => 2

    /**
     * Native name: RESTART_NO_PATCH
     * @type {Integer (UInt32)}
     */
    static NO_PATCH => 4

    /**
     * Native name: RESTART_NO_REBOOT
     * @type {Integer (UInt32)}
     */
    static NO_REBOOT => 8
}
