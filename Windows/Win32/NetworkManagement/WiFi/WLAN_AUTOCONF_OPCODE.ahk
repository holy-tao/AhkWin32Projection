#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WLAN_AUTOCONF_OPCODE enumeration specifies an automatic configuration parameter.
 * @remarks
 * The <b>WLAN_AUTOCONF_OPCODE</b> enumerated type is used by the Auto Configuration Module (ACM), the wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <b>WLAN_AUTOCONF_OPCODE</b> specifies the possible values for the <i>OpCode</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryautoconfigparameter">WlanQueryAutoConfigParameter</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetautoconfigparameter">WlanSetAutoConfigParameter</a> functions.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_autoconf_opcode~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_AUTOCONF_OPCODE extends Win32Enum{

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_start => 0

    /**
     * The opcode used to set or query the parameter specifying  whether user and group policy denied networks will be included in the available networks list.
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_show_denied_networks => 1

    /**
     * The opcode used  to query the power settings.
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_power_setting => 2

    /**
     * The opcode used to query whether profiles not created by group policy can be used to connect to an allowed network with a matching group policy profile.
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_only_use_gp_profiles_for_allowed_networks => 3

    /**
     * The opcode used to set or query whether the current wireless interface has shared user credentials allowed.
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_allow_explicit_creds => 4

    /**
     * The opcode used to set or query the blocked period setting for the current wireless interface. The blocked period is the amount of time, in seconds, for which automatic connection to a wireless network will not be attempted after a previous failure.
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_block_period => 5

    /**
     * The opcode used to set or query whether extensibility on a virtual station is allowed. By default, extensibility on a virtual station is allowed. The value for this opcode is persisted across reboots.
     * 
     * This enumeration value is supported on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_allow_virtual_station_extensibility => 6

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_autoconf_opcode_end => 7
}
