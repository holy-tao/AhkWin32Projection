#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_msm~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_NOTIFICATION_MSM{

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_start => 0

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_associating => 1

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_associated => 2

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_authenticating => 3

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_connected => 4

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_roaming_start => 5

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_roaming_end => 6

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_radio_state_change => 7

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_signal_quality_change => 8

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_disassociating => 9

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_disconnected => 10

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_peer_join => 11

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_peer_leave => 12

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_adapter_removal => 13

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_adapter_operation_mode_change => 14

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_link_degraded => 15

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_link_improved => 16

    /**
     * @type {Integer (Int32)}
     */
    static wlan_notification_msm_end => 17
}
