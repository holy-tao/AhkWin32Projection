#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * Contains information about media specific module (MSM) connection related notifications.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function is used by an application to register and unregister notifications on all wireless interfaces. When registering for notifications, an application must provide a callback function pointed to by the <i>funcCallback</i> parameter passed to the <b>WlanRegisterNotification</b> function. The prototype for this callback function is the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a>. This callback function will receive notifications that have been registered in the <i>dwNotifSource</i> parameter passed to the <b>WlanRegisterNotification</b> function. 
  * 
  * The callback function is called with a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure as the first parameter that contains detailed information on the notification. 
  * 
  * If the <b>NotificationSource</b> member of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure received by the callback function is <b>WLAN_NOTIFICATION_SOURCE_MSM</b>, then the received notification is a media specific module (MSM) notification. The <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a> function  determines the interpretation of the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure.  For some of these notifications, a <b>WLAN_MSM_NOTIFICATION_DATA</b> structure is returned in the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure. 
  * 
  * For more information on these notifications, see the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_msm-r1">WLAN_NOTIFICATION_MSM</a> enumeration reference.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_msm_notification_data
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_MSM_NOTIFICATION_DATA extends Win32Struct
{
    static sizeof => 584

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_connection_mode">WLAN_CONNECTION_MODE</a> value that specifies the mode of the connection.
     * @type {Integer}
     */
    wlanConnectionMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The name of the profile used for the connection. WLAN_MAX_NAME_LENGTH is 256. Profile names are case-sensitive. This string must be NULL-terminated.
     * @type {String}
     */
    strProfileName {
        get => StrGet(this.ptr + 4, 255, "UTF-16")
        set => StrPut(value, this.ptr + 4, 255, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that contains the SSID of the association.
     * @type {DOT11_SSID}
     */
    dot11Ssid{
        get {
            if(!this.HasProp("__dot11Ssid"))
                this.__dot11Ssid := DOT11_SSID(520, this)
            return this.__dot11Ssid
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> value that indicates the BSS network type.
     * @type {Integer}
     */
    dot11BssType {
        get => NumGet(this, 556, "int")
        set => NumPut("int", value, this, 556)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-mac-address-type">DOT11_MAC_ADDRESS</a> that specifies the MAC address of the peer or access point.
     * @type {Array<Byte>}
     */
    dot11MacAddr{
        get {
            if(!this.HasProp("__dot11MacAddrProxyArray"))
                this.__dot11MacAddrProxyArray := Win32FixedArray(this.ptr + 560, 6, Primitive, "char")
            return this.__dot11MacAddrProxyArray
        }
    }

    /**
     * Indicates whether security is enabled for this connection.  If <b>TRUE</b>, security is enabled.
     * @type {BOOL}
     */
    bSecurityEnabled {
        get => NumGet(this, 568, "int")
        set => NumPut("int", value, this, 568)
    }

    /**
     * Indicates whether the peer is the first to join the ad hoc network created by the machine. If <b>TRUE</b>, the peer is the first to join.
     * 
     * After the first peer joins the network, the interface state of the machine that created the ad hoc network changes from wlan_interface_state_ad_hoc_network_formed to wlan_interface_state_connected.
     * @type {BOOL}
     */
    bFirstPeer {
        get => NumGet(this, 572, "int")
        set => NumPut("int", value, this, 572)
    }

    /**
     * Indicates whether the peer is the last to leave the ad hoc network created by the machine. If <b>TRUE</b>, the peer is the last to leave. After the last peer leaves the network, the interface state of the machine that created the ad hoc network changes from wlan_interface_state_connected to wlan_interface_state_ad_hoc_network_formed.
     * @type {BOOL}
     */
    bLastPeer {
        get => NumGet(this, 576, "int")
        set => NumPut("int", value, this, 576)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-reason-code">WLAN_REASON_CODE</a> that indicates the reason for an operation failure.  If the operation succeeds, this field has a value of <b>WLAN_REASON_CODE_SUCCESS</b>. Otherwise, this field indicates the reason for the failure.
     * @type {Integer}
     */
    wlanReasonCode {
        get => NumGet(this, 580, "uint")
        set => NumPut("uint", value, this, 580)
    }
}
