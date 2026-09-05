#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class POWER_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: PowerRequestDisplayRequired
     * @type {Integer (Int32)}
     */
    static DisplayRequired => 0

    /**
     * Native name: PowerRequestSystemRequired
     * @type {Integer (Int32)}
     */
    static SystemRequired => 1

    /**
     * Native name: PowerRequestAwayModeRequired
     * @type {Integer (Int32)}
     */
    static AwayModeRequired => 2

    /**
     * Native name: PowerRequestExecutionRequired
     * @type {Integer (Int32)}
     */
    static ExecutionRequired => 3
}
