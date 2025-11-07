#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the possible values of the operation code for the properties to query or set on the wireless Hosted Network.
 * @remarks
 * 
 * The <b>WLAN_HOSTED_NETWORK_OPCODE</b> enumerated type is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.  
 * 
 * The <b>WLAN_HOSTED_NETWORK_OPCODE</b> specifies the possible values of the operation code for the properties to query or set on the wireless Hosted Network.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ne-wlanapi-wlan_hosted_network_opcode
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_HOSTED_NETWORK_OPCODE{

    /**
     * The opcode used to query or set the wireless Hosted Network connection settings.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_opcode_connection_settings => 0

    /**
     * The opcode used to query the wireless Hosted Network security settings.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_opcode_security_settings => 1

    /**
     * The opcode used to query the wireless Hosted Network station profile.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_opcode_station_profile => 2

    /**
     * The opcode used to query or set the wireless Hosted Network enabled flag.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_opcode_enable => 3
}
