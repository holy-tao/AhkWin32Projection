#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_intf_opcode~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_INTF_OPCODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_autoconf_start => 0

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_autoconf_enabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_background_scan_enabled => 2

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_media_streaming_mode => 3

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_radio_state => 4

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_bss_type => 5

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_interface_state => 6

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_current_connection => 7

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_channel_number => 8

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_supported_infrastructure_auth_cipher_pairs => 9

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_supported_adhoc_auth_cipher_pairs => 10

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_supported_country_or_region_string_list => 11

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_current_operation_mode => 12

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_supported_safe_mode => 13

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_certified_safe_mode => 14

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_hosted_network_capable => 15

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_management_frame_protection_capable => 16

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_secondary_sta_interfaces => 17

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_secondary_sta_synchronized_connections => 18

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_realtime_connection_quality => 19

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_qos_info => 20

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_autoconf_end => 268435455

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_msm_start => 268435712

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_statistics => 268435713

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_rssi => 268435714

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_msm_end => 536870911

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_security_start => 536936448

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_security_end => 805306367

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_ihv_start => 805306368

    /**
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_ihv_end => 1073741823
}
