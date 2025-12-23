#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WLAN_NOTIFICATION_MSM enumeration specifies the possible values of the NotificationCode member of the WLAN_NOTIFICATION_DATA structure.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_acm-r1">WLAN_NOTIFICATION_ACM</a> enumerated type is used by the Media Specific Module, the new wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <b>WLAN_NOTIFICATION_MSM</b> specifies the possible values for the <b>NotificationCode</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure for received notifications  when the <b>NotificationSource</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure is <b>WLAN_NOTIFICATION_SOURCE_MSM</b>. 
 * 
 * The starting value for the <b>WLAN_NOTIFICATION_MSM</b> enumeration is defined as L2_NOTIFICATION_CODE_PUBLIC_BEGIN in the <i>l2cmn.h</i> header file.  Note that the <i>l2cmn.h</i> header is automatically included by the <i>wlanapi.h</i> header file.
 * 
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function is used by an application to register and unregister notifications on all wireless interfaces. When registering for notifications, an application must provide a callback function pointed to by the <i>funcCallback</i> parameter passed to the <b>WlanRegisterNotification</b> function. The prototype for this callback function is the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a>. This callback function will receive notifications that have been registered in the <i>dwNotifSource</i> parameter passed to the <b>WlanRegisterNotification</b> function. 
 * 
 * The callback function is called with a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure as the first parameter that contains detailed information on the notification. The callback function also receives a second parameter that contains a pointer to the client context passed in the <i>pCallbackContext</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function. This client context can be a <b>NULL</b> pointer if that is what was passed to the <b>WlanRegisterNotification</b> function.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_msm~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_NOTIFICATION_MSM extends Win32Enum{

    /**
     * The beginning of the range that specifies the possible values for ACM notifications.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_start => 0

    /**
     * A wireless device is in the process of associating with an access point or a peer station. 
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_associating => 1

    /**
     * The wireless device has associated with an access point or a peer station.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_associated => 2

    /**
     * The wireless device is in the process of authenticating.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_authenticating => 3

    /**
     * The wireless device is associated with an access point or a peer station, keys have been exchanged, and the wireless device is available to send data. 
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_connected => 4

    /**
     * The wireless device is connected to an access point and has initiated roaming to another access point.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_roaming_start => 5

    /**
     * The wireless device was connected to an access point and has completed roaming to another access point.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_roaming_end => 6

    /**
     * The radio state for an adapter has changed. Each physical layer (PHY) has its own radio state. The radio for an adapter is switched off when the radio state of every PHY is off.  
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_phy_radio_state">WLAN_PHY_RADIO_STATE</a> structure that identifies the new radio state.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_radio_state_change => 7

    /**
     * A signal quality change for the currently associated access point or peer station.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a ULONG WLAN_SIGNAL_QUALITY that identifies  the new signal quality.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_signal_quality_change => 8

    /**
     * A wireless device is in the process of disassociating from an access point or a peer station. 
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_disassociating => 9

    /**
     * The wireless device is not associated with an access point or a peer station. 
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information. The <b>wlanReasonCode</b> member of the <b>WLAN_MSM_NOTIFICATION_DATA</b> structure  indicates the reason for the disconnect.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_disconnected => 10

    /**
     * A peer has joined an adhoc network.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_peer_join => 11

    /**
     * A peer has left an adhoc network.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_peer_leave => 12

    /**
     * A wireless adapter has been removed from the local computer. 
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_msm_notification_data">WLAN_MSM_NOTIFICATION_DATA</a> structure that contains connection-related information.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_adapter_removal => 13

    /**
     * The operation mode of the wireless device has changed. 
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a ULONG that identifies the new operation mode.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_adapter_operation_mode_change => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_link_degraded => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_link_improved => 16

    /**
     * Indicates the end of the range that specifies the possible values for MSM notifications.
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_end => 17
}
