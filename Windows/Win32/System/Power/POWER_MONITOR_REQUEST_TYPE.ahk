#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class POWER_MONITOR_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: MonitorRequestTypeOff
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Native name: MonitorRequestTypeOnAndPresent
     * @type {Integer (Int32)}
     */
    static OnAndPresent => 1

    /**
     * Native name: MonitorRequestTypeToggleOn
     * @type {Integer (Int32)}
     */
    static ToggleOn => 2
}
