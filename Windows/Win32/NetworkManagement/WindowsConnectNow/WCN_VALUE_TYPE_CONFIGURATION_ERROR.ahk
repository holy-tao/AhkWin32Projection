#Requires AutoHotkey v2.0.0 64-bit

/**
 * WCN_VALUE_TYPE_CONFIGURATION_ERROR enumeration defines possible error values returned to a device while attempting to configure to, and associate with, the WLAN.
 * @see https://docs.microsoft.com/windows/win32/api//wcntypes/ne-wcntypes-wcn_value_type_configuration_error
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_CONFIGURATION_ERROR{

    /**
     * No error. An application must be prepared to handle devices that signal 'No Error' even if the device detected an error.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_NO_ERROR => 0

    /**
     * Could not read the out-of-band (OOB) interface.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_OOB_INTERFACE_READ_ERROR => 1

    /**
     * Could not decrypt the Cyclic Redundancy Check (CRC) value.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_DECRYPTION_CRC_FAILURE => 2

    /**
     * The 2.4 GHz channel is not supported.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_2_4_CHANNEL_NOT_SUPPORTED => 3

    /**
     * The 5.0 GHz channel is not supported.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_5_0_CHANNEL_NOT_SUPPORTED => 4

    /**
     * The wireless signal is not strong enough to initiate a connection. 
 * 
 * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_SIGNAL_TOO_WEAK => 5

    /**
     * Network authentication failed.
 * 
 * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_NETWORK_AUTHENTICATION_FAILURE => 6

    /**
     * Network association failed.
 * 
 * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_NETWORK_ASSOCIATION_FAILURE => 7

    /**
     * The DHCP server did not respond.
 * 
 * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_NO_DHCP_RESPONSE => 8

    /**
     * DHCP configuration failed.
 * 
 * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_FAILED_DHCP_CONFIG => 9

    /**
     * There was an IP address conflict.
 * 
 * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_IP_ADDRESS_CONFLICT => 10

    /**
     * Could not connect to the registrar.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_COULD_NOT_CONNECT_TO_REGISTRAR => 11

    /**
     * Multiple push button configuration (PBC) sessions were detected.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_MULTIPLE_PBC_SESSIONS_DETECTED => 12

    /**
     * Rogue activity is suspected.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_ROGUE_ACTIVITY_SUSPECTED => 13

    /**
     * The device is busy.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_DEVICE_BUSY => 14

    /**
     * Setup is locked.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_SETUP_LOCKED => 15

    /**
     * The message timed out.
 * 
 * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_MESSAGE_TIMEOUT => 16

    /**
     * The registration session timed out.
 * 
 * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_REGISTRATION_SESSION_TIMEOUT => 17

    /**
     * Device password authentication failed.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_CE_DEVICE_PASSWORD_AUTH_FAILURE => 18
}
