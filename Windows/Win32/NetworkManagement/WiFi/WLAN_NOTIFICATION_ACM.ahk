#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WLAN_NOTIFICATION_ACM enumeration specifies the possible values of the NotificationCode member of the WLAN_NOTIFICATION_DATA structure.
 * @remarks
 * The <b>WLAN_NOTIFICATION_ACM</b> enumerated type is used by the Auto Configuration Module, the new wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <b>WLAN_NOTIFICATION_ACM</b> specifies the possible values for the <b>NotificationCode</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure for received notifications  when the <b>NotificationSource</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure is <b>WLAN_NOTIFICATION_SOURCE_ACM</b>. 
 * 
 * The starting value for the <b>WLAN_NOTIFICATION_ACM</b> enumeration is defined as L2_NOTIFICATION_CODE_V2_BEGIN in the <i>l2cmn.h</i> header file.  Note that the <i>l2cmn.h</i> header is automatically included by the <i>wlanapi.h</i> header file.
 * 
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function is used by an application to register and unregister notifications on all wireless interfaces. When registering for notifications, an application must provide a callback function pointed to by the <i>funcCallback</i> parameter passed to the <b>WlanRegisterNotification</b> function. The prototype for this callback function is the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nc-wlanapi-wlan_notification_callback">WLAN_NOTIFICATION_CALLBACK</a>. This callback function will receive notifications that have been registered in the <i>dwNotifSource</i> parameter passed to the <b>WlanRegisterNotification</b> function. 
 * 
 * The callback function is called with a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure as the first parameter that contains detailed information on the notification. The callback function also receives a second parameter that contains a pointer to the client context passed in the <i>pCallbackContext</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function. This client context can be a <b>NULL</b> pointer if that is what was passed to the <b>WlanRegisterNotification</b> function.
 * 
 * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Only the <b>wlan_notification_acm_connection_complete</b> and <b>wlan_notification_acm_disconnected</b> notifications are available.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_acm~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_NOTIFICATION_ACM extends Win32Enum{

    /**
     * Indicates the beginning of the range that specifies the possible values for ACM notifications.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_start => 0

    /**
     * Autoconfiguration is enabled.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_autoconf_enabled => 1

    /**
     * Autoconfiguration is disabled.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_autoconf_disabled => 2

    /**
     * Background scans are enabled.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_background_scan_enabled => 3

    /**
     * Background scans are disabled.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_background_scan_disabled => 4

    /**
     * The BSS type for an interface has changed.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-bss-type">DOT11_BSS_TYPE</a> enumeration value that identifies the new basic service set (BSS) type.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_bss_type_change => 5

    /**
     * The power setting for an interface has changed.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_power_setting-r1">WLAN_POWER_SETTING</a> enumeration value that identifies the new power setting of an interface.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_power_setting_change => 6

    /**
     * A scan for networks has completed.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_scan_complete => 7

    /**
     * A scan for connectable networks failed. 
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-reason-code">WLAN_REASON_CODE</a> data type value that identifies the reason the WLAN operation failed.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_scan_fail => 8

    /**
     * A connection has started  to a network in range.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_notification_data">WLAN_CONNECTION_NOTIFICATION_DATA</a> structure that identifies the network  information for the connection attempt.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_connection_start => 9

    /**
     * A connection has completed.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_notification_data">WLAN_CONNECTION_NOTIFICATION_DATA</a> structure that identifies the network  information for the connection attempt that completed. The connection succeeded if the <b>wlanReasonCode</b> in <b>WLAN_CONNECTION_NOTIFICATION_DATA</b> is <b>WLAN_REASON_CODE_SUCCESS</b>. Otherwise, the connection has failed.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_connection_complete => 10

    /**
     * A connection attempt has failed.
     * 
     * A connection consists of one or more connection attempts. An application may receive zero or more <b>wlan_notification_acm_connection_attempt_fail </b> notifications between receiving the <b>wlan_notification_acm_connection_start</b> notification and the <b>wlan_notification_acm_connection_complete</b> notification.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_notification_data">WLAN_CONNECTION_NOTIFICATION_DATA</a> structure that identifies the network  information for the connection attempt that failed.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_connection_attempt_fail => 11

    /**
     * A change in the filter list has occurred, either through group policy or a call to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetfilterlist">WlanSetFilterList</a> function. 
     * 
     * An application can call the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetfilterlist">WlanGetFilterList</a> function to retrieve the new filter list.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_filter_list_change => 12

    /**
     * A wireless LAN interface is been added to or enabled on the local computer.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_interface_arrival => 13

    /**
     * A wireless LAN interface is been removed from or disabled on the local computer.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_interface_removal => 14

    /**
     * A change in a profile or the profile list has occurred, either through group policy or by calls to Native Wifi functions. 
     * 
     * An application can call the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetprofilelist">WlanGetProfileList</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetprofile">WlanGetProfile</a> functions to retrieve the updated profiles. The interface on which the profile list changes is identified by the <b>InterfaceGuid</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_profile_change => 15

    /**
     * A profile name has changed, either through group policy or by calls to Native Wifi functions. 
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a buffer that contains   two NULL-terminated WCHAR strings, the old profile name followed by the new profile name.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_profile_name_change => 16

    /**
     * All profiles were exhausted in an attempt to autoconnect.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_profiles_exhausted => 17

    /**
     * The wireless service cannot find any connectable network after a scan. 
     * 
     * The interface on which no connectable network is found is identified by identified by the <b>InterfaceGuid</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_network_not_available => 18

    /**
     * The wireless service found a connectable network after a scan, the interface was in the disconnected state, and there is no compatible auto-connect profile that the wireless service can use to connect .
     * 
     * The interface on which connectable networks are found is identified by the <b>InterfaceGuid</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_network_available => 19

    /**
     * The wireless service is disconnecting from a  connectable network.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_notification_data">WLAN_CONNECTION_NOTIFICATION_DATA</a> structure that identifies the network  information for the connection that is disconnecting.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_disconnecting => 20

    /**
     * The wireless service has disconnected from a  connectable network.
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_connection_notification_data">WLAN_CONNECTION_NOTIFICATION_DATA</a> structure that identifies the network  information for the connection that disconnected.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_disconnected => 21

    /**
     * A state change has occurred for an adhoc network. 
     * 
     * The <b>pData</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure points to a  <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_adhoc_network_state-r1">WLAN_ADHOC_NETWORK_STATE</a> enumeration value that identifies the new  adhoc network state.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_adhoc_network_state_change => 22

    /**
     * This value is supported on Windows 8 and later.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_profile_unblocked => 23

    /**
     * The screen power has changed. 
     * 
     * The <b>pData</b> member points to a  <b>BOOL</b> value that indicates the value of the screen power change. When this value is <b>TRUE</b>, the screen changed to on. When this value is <b>FALSE</b>, the screen changed to off. 
     * 
     * This value is supported on Windows 8 and later.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_screen_power_change => 24

    /**
     * This value is supported on Windows 8 and later.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_profile_blocked => 25

    /**
     * This value is supported on Windows 8 and later.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_scan_list_refresh => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_operational_state_change => 27

    /**
     * Indicates the end of the range that specifies the possible values for ACM notifications.
     * @type {Integer (Int32)}
     */
    static wlan_notification_acm_end => 28
}
