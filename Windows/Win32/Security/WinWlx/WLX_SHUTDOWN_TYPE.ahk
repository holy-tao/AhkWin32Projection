#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.WinWlx
 */
class WLX_SHUTDOWN_TYPE extends Win32Enum {

    /**
     * Native name: WLX_SAS_ACTION_SHUTDOWN
     * @type {Integer (UInt32)}
     */
    static SAS_ACTION_SHUTDOWN => 5

    /**
     * Native name: WLX_SAS_ACTION_SHUTDOWN_REBOOT
     * @type {Integer (UInt32)}
     */
    static SAS_ACTION_SHUTDOWN_REBOOT => 11

    /**
     * Native name: WLX_SAS_ACTION_SHUTDOWN_POWER_OFF
     * @type {Integer (UInt32)}
     */
    static SAS_ACTION_SHUTDOWN_POWER_OFF => 10
}
