#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class MONITOR_DISPLAY_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PowerMonitorOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static PowerMonitorOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerMonitorDim => 2
}
