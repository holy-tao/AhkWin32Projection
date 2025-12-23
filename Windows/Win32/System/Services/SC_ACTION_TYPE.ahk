#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SC_ACTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SC_ACTION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SC_ACTION_RESTART => 1

    /**
     * @type {Integer (Int32)}
     */
    static SC_ACTION_REBOOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SC_ACTION_RUN_COMMAND => 3

    /**
     * @type {Integer (Int32)}
     */
    static SC_ACTION_OWN_RESTART => 4
}
