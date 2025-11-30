#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_POWER_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_active => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_powersave => 2
}
