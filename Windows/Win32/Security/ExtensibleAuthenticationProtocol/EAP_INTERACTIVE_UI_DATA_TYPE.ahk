#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the set of types of interactive UI context data supplied to certain supplicant API calls.
 * @remarks
 * 
  * The <b>EAP_INTERACTIVE_UI_DATA_TYPE</b> is used to support Single-Sign-On (SSO).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ne-eaptypes-eap_interactive_ui_data_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_INTERACTIVE_UI_DATA_TYPE{

    /**
     * The data contains an EAP security credential retry request.
     * @type {Integer (Int32)}
     */
    static EapCredReq => 0

    /**
     * The data contains an EAP security credential retry response.
     * @type {Integer (Int32)}
     */
    static EapCredResp => 1

    /**
     * The data contains an EAP security credential expiration request.
     * @type {Integer (Int32)}
     */
    static EapCredExpiryReq => 2

    /**
     * The data contains an EAP security credential expiration response.
     * @type {Integer (Int32)}
     */
    static EapCredExpiryResp => 3

    /**
     * The data contains an EAP security credential logon request.
     * @type {Integer (Int32)}
     */
    static EapCredLogonReq => 4

    /**
     * The data contains an EAP security credential logon response.
     * @type {Integer (Int32)}
     */
    static EapCredLogonResp => 5
}
