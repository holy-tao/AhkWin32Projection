#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Specifies the parameters used when using the WlanConnect function.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_connection_parameters
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_CONNECTION_PARAMETERS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_connection_mode">WLAN_CONNECTION_MODE</a> value that specifies the mode of connection.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_connection_mode_profile</b>  value is supported.
     * @type {Integer}
     */
    wlanConnectionMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the profile being used for the connection. 
     * 
     * If  <b>wlanConnectionMode</b> is set to <b>wlan_connection_mode_profile</b>, then <b>strProfile</b> specifies the name of the profile used for the connection. If <b>wlanConnectionMode</b> is set to <b>wlan_connection_mode_temporary_profile</b>, then <b>strProfile</b> specifies the XML representation of the profile used for the connection. If <b>wlanConnectionMode</b> is set to <b>wlan_connection_mode_discovery_secure</b> or <b>wlan_connection_mode_discovery_unsecure</b>, then <b>strProfile</b> should be set to <b>NULL</b>.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The profile must meet the compatibility criteria described in <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wireless-profile-compatibility">Wireless Profile Compatibility</a>.
     * @type {PWSTR}
     */
    strProfile{
        get {
            if(!this.HasProp("__strProfile"))
                this.__strProfile := PWSTR(this.ptr + 8)
            return this.__strProfile
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that specifies the SSID of the network to connect to.  This parameter is optional. When set to <b>NULL</b>, all SSIDs in the profile will be tried.  This parameter must not be <b>NULL</b> if <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_connection_mode">WLAN_CONNECTION_MODE</a> is set to <b>wlan_connection_mode_discovery_secure</b> or <b>wlan_connection_mode_discovery_unsecure</b>.
     * @type {Pointer<DOT11_SSID>}
     */
    pDot11Ssid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bssid-list">DOT11_BSSID_LIST</a> structure that contains the list of basic service set (BSS) identifiers desired for the connection.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This member must be <b>NULL</b>.
     * @type {Pointer<DOT11_BSSID_LIST>}
     */
    pDesiredBssidList {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> value that indicates the BSS type of the network.  If a profile is provided, this BSS type must be the same as the one in the profile.
     * @type {Integer}
     */
    dot11BssType {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The following table shows flags used to specify the connection parameters.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WLAN_CONNECTION_HIDDEN_NETWORK</td>
     * <td>0x00000001</td>
     * <td>Connect to the destination network even if the destination is a hidden network. A hidden network does not broadcast its SSID. Do not use this flag if the destination network is an ad-hoc network.If the profile specified by <b>strProfile</b> is not <b>NULL</b>, then this flag is ignored and the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-nonbroadcast-ssidconfig-element">nonBroadcast</a> profile element determines whether to connect to a hidden network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>WLAN_CONNECTION_ADHOC_JOIN_ONLY</td>
     * <td>0x00000002</td>
     * <td>Do not form an ad-hoc network. Only join an ad-hoc network if the network already exists. Do not use this flag if the destination network is an infrastructure network.</td>
     * </tr>
     * <tr>
     * <td>WLAN_CONNECTION_IGNORE_PRIVACY_BIT</td>
     * <td>0x00000004</td>
     * <td>Ignore the privacy bit when connecting to the network. Ignoring the privacy bit has the effect of ignoring whether packets are encrypted and ignoring the method of encryption used. Only use this flag when connecting to an infrastructure network using a temporary profile.</td>
     * </tr>
     * <tr>
     * <td>WLAN_CONNECTION_EAPOL_PASSTHROUGH </td>
     * <td>0x00000008</td>
     * <td>Exempt EAPOL traffic from encryption and decryption. This flag is used when an application must send EAPOL traffic over an infrastructure  network that uses Open authentication and WEP encryption. This flag must not be used to connect to networks that require 802.1X authentication. This flag is only valid when <b>wlanConnectionMode</b> is set to <b>wlan_connection_mode_temporary_profile</b>. Avoid using this flag whenever possible.</td>
     * </tr>
     * <tr>
     * <td>WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE </td>
     * <td>0x00000010</td>
     * <td>Automatically persist discovery profile on successful connection completion.
     * This flag is only valid for wlan_connection_mode_discovery_secure or
     * wlan_connection_mode_discovery_unsecure. The profile will be saved as an all 
     * user profile, with the name generated from the SSID using WlanUtf8SsidToDisplayName. 
     * If there is already a profile with the same name, a number will be appended 
     * to the end of the profile name. The profile will be saved with manual connection mode,
     * unless WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE_CONNECTION_MODE_AUTO is also specified.</td>
     * </tr>
     * <tr>
     * <td>WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE_CONNECTION_MODE_AUTO </td>
     * <td>0x00000020</td>
     * <td>To be used in conjunction with WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE. The 
     * discovery profile will be persisted with automatic connection mode.</td>
     * </tr>
     * <tr>
     * <td>WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE_OVERWRITE_EXISTING</td>
     * <td>0x00000040</td>
     * <td>To be used in conjunction with WLAN_CONNECTION_PERSIST_DISCOVERY_PROFILE. The 
     * discovery profile will be persisted and attempt to overwrite an existing profile with the same name.</td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>This member must be set to 0.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
