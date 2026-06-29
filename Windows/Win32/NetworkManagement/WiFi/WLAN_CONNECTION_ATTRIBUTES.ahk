#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\WLAN_CONNECTION_MODE.ahk" { WLAN_CONNECTION_MODE }
#Import ".\WLAN_ASSOCIATION_ATTRIBUTES.ahk" { WLAN_ASSOCIATION_ATTRIBUTES }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\WLAN_SECURITY_ATTRIBUTES.ahk" { WLAN_SECURITY_ATTRIBUTES }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import ".\WLAN_INTERFACE_STATE.ahk" { WLAN_INTERFACE_STATE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Defines the attributes of a wireless connection.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_connection_attributes
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_CONNECTION_ATTRIBUTES {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_state-r1">WLAN_INTERFACE_STATE</a> value that indicates the state of the interface.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_interface_state_connected</b>, <b>wlan_interface_state_disconnected</b>, and <b>wlan_interface_state_authenticating</b> values are supported.
     */
    isState : WLAN_INTERFACE_STATE

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_connection_mode">WLAN_CONNECTION_MODE</a> value that indicates the mode of the connection.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_connection_mode_profile</b>  value is supported.
     */
    wlanConnectionMode : WLAN_CONNECTION_MODE

    /**
     * The name of the profile used for the connection. Profile names are case-sensitive. This string must be NULL-terminated.
     */
    strProfileName : WCHAR[256]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_association_attributes">WLAN_ASSOCIATION_ATTRIBUTES</a> structure  that contains the attributes of the association.
     */
    wlanAssociationAttributes : WLAN_ASSOCIATION_ATTRIBUTES

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_security_attributes">WLAN_SECURITY_ATTRIBUTES</a> structure that contains the security attributes of the connection.
     */
    wlanSecurityAttributes : WLAN_SECURITY_ATTRIBUTES

}
