#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_power_setting~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_POWER_SETTING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_no_saving => 0

    /**
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_low_saving => 1

    /**
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_medium_saving => 2

    /**
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_maximum_saving => 3

    /**
     * @type {Integer (Int32)}
     */
    static wlan_power_setting_invalid => 4
}
