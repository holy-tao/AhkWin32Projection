#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the possible values of the NotificationCode member of the WLAN_NOTIFICATION_DATA structure for 802.1X module notifications.
 * @remarks
 * The <b>ONEX_NOTIFICATION_TYPE</b> enumerated type is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
  * 
  * The <b>ONEX_NOTIFICATION_TYPE</b> specifies the possible values for the <b>NotificationCode</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure for received notifications  when the <b>NotificationSource</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function is used by an application to register and unregister notifications on all wireless interfaces. When registering for notifications, an application must provide a callback function pointed to by the <i>funcCallback</i> parameter passed to the <b>WlanRegisterNotification</b> function. The prototype for this callback function is the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a>. This callback function will receive notifications that have been registered in the <i>dwNotifSource</i> parameter passed to the <b>WlanRegisterNotification</b> function. 
  * 
  * The callback function is called with a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure as the first parameter that contains detailed information on the notification. The callback function also receives a second parameter that contains a pointer to the client context passed in the <i>pCallbackContext</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function. This client context can be a <b>NULL</b> pointer if that is what was passed to the <b>WlanRegisterNotification</b> function.
 * @see https://learn.microsoft.com/windows/win32/api/dot1x/ne-dot1x-onex_notification_type
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class ONEX_NOTIFICATION_TYPE{

    /**
     * Indicates the beginning of the range that specifies the possible values for 802.1X notifications.
     * @type {Integer (Int32)}
     */
    static OneXPublicNotificationBase => 0

    /**
     * Indicates that 802.1X authentication has a status change.
 * 
 * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> structure that contains 802.1X update data.
     * @type {Integer (Int32)}
     */
    static OneXNotificationTypeResultUpdate => 1

    /**
     * Indicates that 802.1X authentication restarted.
 * 
 * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to an  <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ne-dot1x-onex_auth_restart_reason">ONEX_AUTH_RESTART_REASON</a> enumeration value that identifies the reason the authentication was restarted.
     * @type {Integer (Int32)}
     */
    static OneXNotificationTypeAuthRestarted => 2

    /**
     * Indicates the end of the range that specifies the possible values for 802.1X notifications.
     * @type {Integer (Int32)}
     */
    static OneXNotificationTypeEventInvalid => 3

    /**
     * Indicates the end of the range that specifies the possible values for 802.1X notifications.
     * @type {Integer (Int32)}
     */
    static OneXNumNotifications => 3
}
