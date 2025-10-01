#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WLAN_INTF_OPCODE enumeration defines various opcodes used to set and query parameters on a wireless interface.
 * @remarks
 * The <b>WLAN_INTF_OPCODE</b> enumerated type defines the possible opcodes that can be passed in the <i>OpCode</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetinterface">WlanSetInterface</a> functions to query or set parameters on a wireless interface.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_intf_opcode~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_INTF_OPCODE{

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_autoconf_start => 0

    /**
     * The opcode used to set or query whether auto config is enabled.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_autoconf_enabled => 1

    /**
     * The opcode used to set or query whether background scan is enabled.
 * 
 * Background scan can only be disabled when the interface is in the connected state. Background scan is disabled if at least one client disables it.
 * If the interface gets disconnected, background scan will be enabled automatically.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_background_scan_enabled => 2

    /**
     * The opcode used to set or query the media streaming mode of the driver.
 * 
 * The media streaming mode can only be set when the interface is in the connected state. The media streaming mode is enabled if at least one client enables it.  If the interface gets disconnected, the media streaming mode is disabled automatically
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_media_streaming_mode => 3

    /**
     * The opcode used to set or query the radio state.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_radio_state => 4

    /**
     * The opcode used to set or query the BSS type of the interface.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_bss_type => 5

    /**
     * The opcode used to query the state of the interface. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_interface_state => 6

    /**
     * The opcode used to query information about the current connection of the interface. 
 * 
 * This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function. If the interface is in disconnected or disconnecting state, <b>WlanQueryInterface</b> function returns <b>ERROR_INVALID_STATE</b>.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_current_connection => 7

    /**
     * The opcode used to query the current channel on which the wireless interface is operating. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_channel_number => 8

    /**
     * The opcode used to query the supported auth/cipher pairs for infrastructure mode. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_supported_infrastructure_auth_cipher_pairs => 9

    /**
     * The opcode used to query the supported auth/cipher pairs for ad hoc mode. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_supported_adhoc_auth_cipher_pairs => 10

    /**
     * The opcode used to query the list of supported country or region strings. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_supported_country_or_region_string_list => 11

    /**
     * The opcode used to set or query the current operation mode of the wireless interface. For more information about operation modes, see <a href="https://www.microsoft.com/?ref=go">Native 802.11 Operation Modes</a>.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_current_operation_mode => 12

    /**
     * The opcode used to query whether the miniport/NIC combination supports Federal Information Processing Standards (FIPS) mode. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function. FIPS mode is also known as safe mode. This wireless safe mode is different than the operating system safe mode.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_supported_safe_mode => 13

    /**
     * The opcode used to query whether the miniport/NIC combination is FIPS certified. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_certified_safe_mode => 14

    /**
     * The opcode used to query for Hosted Network support in the device driver associated with the Wireless interface. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function. 
 * 
 * The data type returned for this opcode by a query is a Boolean. A value returned of <b>TRUE</b> indicates Hosted Network is supported. A value of <b>FALSE</b> indicates Hosted Network is not supported. 
 * 
 * This value is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_hosted_network_capable => 15

    /**
     * The opcode used to query whether Management Frame Protection (MFP) is supported in the device driver associated with the Wireless interface. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function. 
 * 
 * MFP is defined in the IEEE 802.11w-2009 amendment to 802.11 standard.
 * 
 * This value is supported on Windows 8 and  on Windows Server 2012.
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
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_autoconf_end => 268435455

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_msm_start => 268435712

    /**
     * The opcode used to query driver statistics. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_statistics => 268435713

    /**
     * Opcode used to query the received signal strength. This opcode can only be used in a query operation with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_rssi => 268435714

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_msm_end => 536870911

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_security_start => 536936448

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_security_end => 805306367

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_ihv_start => 805306368

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wlan_intf_opcode_ihv_end => 1073741823
}
