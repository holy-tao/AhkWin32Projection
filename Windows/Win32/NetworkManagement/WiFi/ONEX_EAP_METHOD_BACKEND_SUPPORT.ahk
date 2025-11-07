#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the possible values for whether the EAP method configured on the supplicant for 802.1X authentication is supported on the authentication server.
 * @remarks
 * 
 * The <b>ONEX_EAP_METHOD_BACKEND_SUPPORT</b> enumeration is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> contains information on a status change to 802.1X authentication. The <b>ONEX_RESULT_UPDATE_DATA</b> structure is returned  when  the <b>NotificationSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>  and the <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure for received notification  is <b>OneXNotificationTypeResultUpdate</b>. For this notification, the <b>pData</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure points to an  <b>ONEX_RESULT_UPDATE_DATA</b> structure that contains information on the 802.1X authentication status change. 
 * 
 * The <b>BackendSupport</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> struct contains a value from the <b>ONEX_EAP_METHOD_BACKEND_SUPPORT</b> enumeration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dot1x/ne-dot1x-onex_eap_method_backend_support
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class ONEX_EAP_METHOD_BACKEND_SUPPORT{

    /**
     * It is not known whether the EAP method configured on the supplicant for 802.1X authentication is supported on the authentication server. This value can be returned if the 802.1X authentication process is in the initial state.
     * @type {Integer (Int32)}
     */
    static OneXEapMethodBackendSupportUnknown => 0

    /**
     * The EAP method configured on the supplicant for 802.1X authentication is supported on the authentication server. The 802.1X handshake is used to decide what is an acceptable EAP method to use.
     * @type {Integer (Int32)}
     */
    static OneXEapMethodBackendSupported => 1

    /**
     * The EAP method configured on the supplicant for 802.1X authentication is not supported on the authentication server.
     * @type {Integer (Int32)}
     */
    static OneXEapMethodBackendUnsupported => 2
}
