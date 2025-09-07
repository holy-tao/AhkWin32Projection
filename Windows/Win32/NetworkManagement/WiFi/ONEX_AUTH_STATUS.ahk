#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the possible values for the 802.1X authentication status.
 * @remarks
 * The <b>ONEX_AUTH_STATUS</b> enumerated type is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
  * 
  * The <b>ONEX_AUTH_STATUS</b> specifies the possible values for the 802.1X authentication status. A value from this enumeration is returned  when  the <b>NotificationSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>  and the <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure for received notifications  is <b>OneXNotificationTypeResultUpdate</b>. For this notification, the <b>pData</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure points to an  <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> structure that contains a <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_status">ONEX_STATUS</a>  structure member in the <b>oneXStatus</b> structure member. The <b>ONEX_STATUS</b>  structure contains a <b>ONEX_AUTH_STATUS</b> enumeration value in the <b>authStatus</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/dot1x/ne-dot1x-onex_auth_status
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class ONEX_AUTH_STATUS{

    /**
     * 802.1X authentication was not started.
     * @type {Integer (Int32)}
     */
    static OneXAuthNotStarted => 0

    /**
     * 802.1X authentication is in progress.
     * @type {Integer (Int32)}
     */
    static OneXAuthInProgress => 1

    /**
     * No 802.1X authenticator was found. The 802.1X authentication was attempted, but no 802.1X peer was found. In this case, either  the network does not support or is not configured to support the 802.1X standard.
     * @type {Integer (Int32)}
     */
    static OneXAuthNoAuthenticatorFound => 2

    /**
     * 802.1X authentication was successful.
     * @type {Integer (Int32)}
     */
    static OneXAuthSuccess => 3

    /**
     * 802.1X authentication was a failure.
     * @type {Integer (Int32)}
     */
    static OneXAuthFailure => 4

    /**
     * Indicates the end of the range that specifies the possible values for 802.1X authentication status.
     * @type {Integer (Int32)}
     */
    static OneXAuthInvalid => 5
}
