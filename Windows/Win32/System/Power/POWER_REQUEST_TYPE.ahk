#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_REQUEST_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestDisplayRequired => 0

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestSystemRequired => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestAwayModeRequired => 2

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestExecutionRequired => 3
}
