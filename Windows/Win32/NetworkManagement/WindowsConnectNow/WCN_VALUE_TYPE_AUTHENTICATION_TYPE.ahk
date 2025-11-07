#Requires AutoHotkey v2.0.0 64-bit

/**
 * WCN_VALUE_TYPE_AUTHENTICATION_TYPE enumeration defines the authentication types supported by the Enrollee (access point or station).
 * @see https://docs.microsoft.com/windows/win32/api//wcntypes/ne-wcntypes-wcn_value_type_authentication_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_AUTHENTICATION_TYPE{

    /**
     * Specifies IEEE 802.11 Open System authentication.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AT_OPEN => 1

    /**
     * Specifies WPA security. Authentication is performed between the supplicant and authenticator over IEEE 802.1X. Encryption keys are dynamic and are derived through the preshared key used by the supplicant and authenticator. 
     * 
     * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AT_WPAPSK => 2

    /**
     * Specifies IEEE 802.11 Shared Key authentication that uses a preshared WEP key. 
     * 
     * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AT_SHARED => 4

    /**
     * Specifies WPA security. Authentication is performed between the supplicant, authenticator, and authentication server over IEEE 802.1X. Encryption keys are dynamic and are derived through the authentication process. 
     * 
     * <div class="alert"><b>Note</b>  Not supported by most access points, consider WPA2PSK authentication instead.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  Not supported in WPS 2.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AT_WPA => 8

    /**
     * Specifies WPA2 security. Authentication is performed between the supplicant, authenticator, and authentication server over IEEE 802.1X. Encryption keys are dynamic and are derived through the authentication process.
     * 
     * <div class="alert"><b>Note</b>  Not supported by most access points, consider WPA2PSK authentication instead.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AT_WPA2 => 16

    /**
     * Specifies WPA2 security. Authentication is performed between the supplicant and authenticator over IEEE 802 1X. Encryption keys are dynamic and are derived through the preshared key used by the supplicant and authenticator.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AT_WPA2PSK => 32

    /**
     * Specifies WPAPSK/WPA2PSK mixed-mode encryption.
     * 
     * <div class="alert"><b>Note</b>  Available starting in Windows 8.1.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_AT_WPAWPA2PSK_MIXED => 34
}
