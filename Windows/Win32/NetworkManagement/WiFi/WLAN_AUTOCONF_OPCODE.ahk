#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_autoconf_opcode~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_AUTOCONF_OPCODE{

    /**
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_start => 0

    /**
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_show_denied_networks => 1

    /**
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_power_setting => 2

    /**
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_only_use_gp_profiles_for_allowed_networks => 3

    /**
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_allow_explicit_creds => 4

    /**
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_block_period => 5

    /**
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_allow_virtual_station_extensibility => 6

    /**
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_end => 7
}
