#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the possible values for the result of a wireless Hosted Network function call.
 * @remarks
 * 
  * The <b>WLAN_HOSTED_NETWORK_REASON</b> enumerated type is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.  
  * 
  * The <b>WLAN_HOSTED_NETWORK_REASON</b> enumerates the possible reasons that a wireless Hosted Network function call failed or the reasons why a particular wireless Hosted Network notification was generated.
  * 
  * On Windows 7 and later, the operating system installs a virtual device if a Hosted Network capable wireless adapter is present on the machine. This virtual device normally shows up in the “Network Connections Folder” as ‘Wireless  Network Connection 2’ with a Device Name of ‘Microsoft Virtual WiFi Miniport adapter’ if the computer has a single wireless network adapter. This virtual device is used exclusively for performing software access point (SoftAP) connections and is not present in the list returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanenuminterfaces">WlanEnumInterfaces</a> function. The lifetime of this virtual device is tied to the physical wireless adapter. If the physical wireless adapter is disabled, this virtual device will be removed as well.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ne-wlanapi-wlan_hosted_network_reason
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_HOSTED_NETWORK_REASON{

    /**
     * The operation was successful.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_success => 0

    /**
     * Unknown error.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_unspecified => 1

    /**
     * Bad parameters.
 * 
 * For example, this reason code is returned if an application failed to reference the client context from the correct handle (the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanopenhandle">WlanOpenHandle</a> function).
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_bad_parameters => 2

    /**
     * Service is shutting down.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_service_shutting_down => 3

    /**
     * Service is out of resources.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_insufficient_resources => 4

    /**
     * This operation requires elevation.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_elevation_required => 5

    /**
     * An attempt was made to write read-only data.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_read_only => 6

    /**
     * Data persistence failed.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_persistence_failed => 7

    /**
     * A cryptographic error occurred.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_crypt_error => 8

    /**
     * User impersonation failed.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_impersonation => 9

    /**
     * An incorrect function call sequence was made.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_stop_before_start => 10

    /**
     * A wireless interface has become available.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_interface_available => 11

    /**
     * A wireless interface has become unavailable.
 * 
 * This reason code is returned by the wireless Hosted Network functions any time the network state of the wireless Hosted Network is <b>wlan_hosted_network_unavailable</b>. For example if the wireless Hosted Network is disabled by group policy on a domain, then the  network state of the wireless Hosted Network is <b>wlan_hosted_network_unavailable</b>. In this case, any calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkstartusing">WlanHostedNetworkStartUsing</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkforcestart">WlanHostedNetworkForceStart</a> function  would return this reason code.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_interface_unavailable => 12

    /**
     * The wireless miniport driver stopped the Hosted Network.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_miniport_stopped => 13

    /**
     * The wireless miniport driver status changed.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_miniport_started => 14

    /**
     * An incompatible connection started.
 * 
 * An incompatible connection refers to one of the following cases:<ul>
 * <li>An ad hoc wireless connection is started on the primary station adapter.</li>
 * <li>Network monitoring is started on the primary station adapter by an application (Network Monitor, for example) that calls the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetinterface">WlanSetInterface</a> function with the <i>OpCode</i> parameter set to  <b>wlan_intf_opcode_current_operation_mode</b> and the <i>pData</i> parameter points to a ULONG that contains <b>DOT11_OPERATION_MODE_NETWORK_MONITOR</b>. </li>
 * <li>A wireless connection is started in FIPS safe mode on the primary station adapter. FIPS safe mode is specified in the profile of the wireless connection. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/wlan-profileschema-fipsmode-authencryption-element">FIPSMode Element</a> .
 * </li>
 * </ul>
 * 
 * 
 * Windows will stop the wireless Hosted Network on  the software-based wireless access point (AP) adapter when an incompatible connection starts on the primary station adapter. The network state of the wireless Hosted Network state would become <b>wlan_hosted_network_unavailable</b>.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_incompatible_connection_started => 15

    /**
     * An incompatible connection stopped.
 * 
 * An incompatible connection previously started on the primary station adapter (wlan_hosted_network_reason_incompatible_connection_started), but the incompatible connection has stopped. If the wireless Hosted Network was previously stopped as a result of an incompatible connection being started, Windows will not automatically restart the wireless Hosted Network. Applications can restart the wireless Hosted Network on the AP adapter by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkstartusing">WlanHostedNetworkStartUsing</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanhostednetworkforcestart">WlanHostedNetworkForceStart</a> function.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_incompatible_connection_stopped => 16

    /**
     * A state change occurred that was caused by explicit user action.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_user_action => 17

    /**
     * A state change occurred that was caused by client abort.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_client_abort => 18

    /**
     * The driver for the wireless Hosted Network failed to start.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_ap_start_failed => 19

    /**
     * A peer connected to the wireless Hosted Network.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_peer_arrived => 20

    /**
     * A peer disconnected from the wireless Hosted Network.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_peer_departed => 21

    /**
     * A peer timed out.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_peer_timeout => 22

    /**
     * The operation was denied by group policy.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_gp_denied => 23

    /**
     * The Wireless LAN service is not running.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_service_unavailable => 24

    /**
     * The wireless adapter used by the wireless Hosted Network changed.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_device_change => 25

    /**
     * The properties of the wireless Hosted Network changed.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_properties_change => 26

    /**
     * A virtual station is active and blocking operation.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_virtual_station_blocking_use => 27

    /**
     * An identical service is available on a virtual station.
     * @type {Integer (Int32)}
     */
    static wlan_hosted_network_reason_service_available_on_virtual_station => 28
}
