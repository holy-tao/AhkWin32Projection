#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_POWER_MODE_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_no_change => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_noncompliant_AP => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_legacy_WFD_device => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_compliant_AP => 3

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_compliant_WFD_device => 4

    /**
     * @type {Integer (Int32)}
     */
    static dot11_power_mode_reason_others => 5
}
