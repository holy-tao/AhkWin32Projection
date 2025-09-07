#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the possible values of the NotificationCode parameter for received notifications on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_NOTIFICATION_CODE</b> enumerated type is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  on Windows Server 2008 R2 with the Wireless LAN Service installed.  
  * 
  * The <b>WLAN_HOSTED_NETWORK_NOTIFICATION_CODE</b> specifies the possible values for the NotificationCode parameter for received notifications  when the NotificationSource parameter is WLAN_NOTIFICATION_SOURCE_HNWK on the wireless Hosted Network. 
  * 
  * The starting value for the <b>WLAN_HOSTED_NETWORK_NOTIFICATION_CODE</b> enumeration is defined as L2_NOTIFICATION_CODE_V2_BEGIN, which is defined  in the <i>l2cmn.h</i> header file.  Note that the <i>l2cmn.h</i> header is automatically included by the <i>wlanapi.h</i> header file.
  * 
  * 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function is used by an application to register and unregister notifications on all wireless interfaces. When registering for notifications, an application must provide a callback function pointed to by the <i>funcCallback</i> parameter passed to the <b>WlanRegisterNotification</b> function. The prototype for this callback function is the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a>. This callback function will receive notifications that have been registered in the <i>dwNotifSource</i> parameter passed to the <b>WlanRegisterNotification</b> function. 
  * 
  * The callback function is called with a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure as the first parameter that contains detailed information on the notification. The callback function also receives a second parameter that contains a pointer to the client context passed in the <i>pCallbackContext</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function. This client context can be a <b>NULL</b> pointer if that is what was passed to the <b>WlanRegisterNotification</b> function.
  * 
  * If the <b>NotificationSource</b> member of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure received by the callback function is <b>WLAN_NOTIFICATION_SOURCE_HNWK</b>, then the received notification is a wireless Hosted Network notification. The <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a> function  determines the interpretation of the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure. 
  * 
  * 
  * 
  * 
  * <table>
  * <tr>
  * <th><b>NotificationCode</b></th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="wlan_hosted_network_state_change"></a><a id="WLAN_HOSTED_NETWORK_STATE_CHANGE"></a>wlan_hosted_network_state_change
  * 
  * </td>
  * <td width="60%">
  * The <i>pData</i> member of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure  should be cast to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_hosted_network_state_change">WLAN_HOSTED_NETWORK_STATE_CHANGE</a> structure and <b>dwDataSize</b> member  would be at least as large as sizeof(<b>WLAN_HOSTED_NETWORK_STATE_CHANGE</b>). 
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="wlan_hosted_network_peer_state_change"></a><a id="WLAN_HOSTED_NETWORK_PEER_STATE_CHANGE"></a>wlan_hosted_network_peer_state_change
  * 
  * </td>
  * <td width="60%">
  * the <i>pData</i> member of <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_data_peer_state_change">WLAN_NOTIFICATION_DATA</a> structure  should be cast to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_hosted_network_data_peer_state_change">WLAN_HOSTED_NETWORK_DATA_PEER_STATE_CHANGE</a> structure and <b>dwDataSize</b> member  would be at least as large as sizeof(<b>WLAN_HOSTED_NETWORK_DATA_PEER_STATE_CHANGE</b>). 
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="wlan_hosted_network_radio_state_change"></a><a id="WLAN_HOSTED_NETWORK_RADIO_STATE_CHANGE"></a>wlan_hosted_network_radio_state_change
  * 
  * </td>
  * <td width="60%">
  * the <i>pData</i> member of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure  should be cast to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_hosted_network_radio_state">WLAN_HOSTED_NETWORK_RADIO_STATE</a>  structure and <b>dwDataSize</b> member  would be at least as large as sizeof(<b>WLAN_HOSTED_NETWORK_RADIO_STATE</b> ). 
  * 
  * </td>
  * </tr>
  * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_hosted_network_notification_code
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_HOSTED_NETWORK_NOTIFICATION_CODE{

    /**
     * The Hosted Network state has changed.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_state_change => 4096

    /**
     * The Hosted Network peer state has changed.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_peer_state_change => 4097

    /**
     * The Hosted Network radio state has changed.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_radio_state_change => 4098
}
