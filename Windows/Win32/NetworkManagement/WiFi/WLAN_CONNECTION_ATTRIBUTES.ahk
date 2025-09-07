#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include .\WLAN_ASSOCIATION_ATTRIBUTES.ahk
#Include .\WLAN_SECURITY_ATTRIBUTES.ahk

/**
 * Defines the attributes of a wireless connection.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_connection_attributes
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_CONNECTION_ATTRIBUTES extends Win32Struct
{
    static sizeof => 608

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_state-r1">WLAN_INTERFACE_STATE</a> value that indicates the state of the interface.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_interface_state_connected</b>, <b>wlan_interface_state_disconnected</b>, and <b>wlan_interface_state_authenticating</b> values are supported.
     * @type {Integer}
     */
    isState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_connection_mode">WLAN_CONNECTION_MODE</a> value that indicates the mode of the connection.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_connection_mode_profile</b>  value is supported.
     * @type {Integer}
     */
    wlanConnectionMode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The name of the profile used for the connection. Profile names are case-sensitive. This string must be NULL-terminated.
     * @type {String}
     */
    strProfileName {
        get => StrGet(this.ptr + 8, 255, "UTF-16")
        set => StrPut(value, this.ptr + 8, 255, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_association_attributes">WLAN_ASSOCIATION_ATTRIBUTES</a> structure  that contains the attributes of the association.
     * @type {WLAN_ASSOCIATION_ATTRIBUTES}
     */
    wlanAssociationAttributes{
        get {
            if(!this.HasProp("__wlanAssociationAttributes"))
                this.__wlanAssociationAttributes := WLAN_ASSOCIATION_ATTRIBUTES(this.ptr + 520)
            return this.__wlanAssociationAttributes
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_security_attributes">WLAN_SECURITY_ATTRIBUTES</a> structure that contains the security attributes of the connection.
     * @type {WLAN_SECURITY_ATTRIBUTES}
     */
    wlanSecurityAttributes{
        get {
            if(!this.HasProp("__wlanSecurityAttributes"))
                this.__wlanSecurityAttributes := WLAN_SECURITY_ATTRIBUTES(this.ptr + 592)
            return this.__wlanSecurityAttributes
        }
    }
}
