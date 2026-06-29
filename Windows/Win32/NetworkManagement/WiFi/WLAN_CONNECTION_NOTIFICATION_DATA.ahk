#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_CONNECTION_MODE.ahk" { WLAN_CONNECTION_MODE }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }
#Import ".\WLAN_CONNECTION_NOTIFICATION_FLAGS.ahk" { WLAN_CONNECTION_NOTIFICATION_FLAGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about connection related notifications.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function is used by an application to register and unregister notifications on all wireless interfaces. When registering for notifications, an application must provide a callback function pointed to by the <i>funcCallback</i> parameter passed to the <b>WlanRegisterNotification</b> function. The prototype for this callback function is the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a>. This callback function will receive notifications that have been registered in the <i>dwNotifSource</i> parameter passed to the <b>WlanRegisterNotification</b> function. 
 * 
 * The callback function is called with a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure as the first parameter that contains detailed information on the notification. 
 * 
 * If the <b>NotificationSource</b> member of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure received by the callback function is <b>WLAN_NOTIFICATION_SOURCE_ACM</b>, then the received notification is an auto configuration module notification. The <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a> function  determines the interpretation of the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure.  For some of these notifications, a <b>WLAN_CONNECTION_NOTIFICATION_DATA</b> structure is returned in the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure. 
 * 
 * For more information on these notifications, see the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_acm-r1">WLAN_NOTIFICATION_ACM</a> enumeration reference.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_connection_notification_data
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_CONNECTION_NOTIFICATION_DATA {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_connection_mode">WLAN_CONNECTION_MODE</a> value that specifies the mode of the connection.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_connection_mode_profile</b>  value is supported.
     */
    wlanConnectionMode : WLAN_CONNECTION_MODE

    /**
     * The name of the profile used for the connection. WLAN_MAX_NAME_LENGTH is 256. Profile names are case-sensitive. This string must be NULL-terminated.
     */
    strProfileName : WCHAR[256]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-ssid">DOT11_SSID</a> structure that contains the SSID of the association.
     */
    dot11Ssid : DOT11_SSID

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> value that indicates the BSS network type.
     */
    dot11BssType : DOT11_BSS_TYPE

    /**
     * Indicates whether security is enabled for this connection.  If <b>TRUE</b>, security is enabled.
     */
    bSecurityEnabled : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-reason-code">WLAN_REASON_CODE</a> that indicates the reason for an operation failure.  This field has a value of <b>WLAN_REASON_CODE_SUCCESS</b> for all connection-related notifications except <b>wlan_notification_acm_connection_complete</b>.  If the connection fails, this field indicates the reason for the failure.
     */
    wlanReasonCode : UInt32

    /**
     * A set of flags that provide additional information for the network connection.
     */
    dwFlags : WLAN_CONNECTION_NOTIFICATION_FLAGS

    /**
     * This field contains the XML presentation of the profile used for discovery, if the connection succeeds.
     */
    strProfileXml : WCHAR[1]

}
