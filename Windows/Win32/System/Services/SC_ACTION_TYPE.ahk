#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SC_ACTION_TYPE extends Win32Enum {

    /**
     * Native name: SC_ACTION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: SC_ACTION_RESTART
     * @type {Integer (Int32)}
     */
    static RESTART => 1

    /**
     * Native name: SC_ACTION_REBOOT
     * @type {Integer (Int32)}
     */
    static REBOOT => 2

    /**
     * Native name: SC_ACTION_RUN_COMMAND
     * @type {Integer (Int32)}
     */
    static RUN_COMMAND => 3

    /**
     * Native name: SC_ACTION_OWN_RESTART
     * @type {Integer (Int32)}
     */
    static OWN_RESTART => 4
}
