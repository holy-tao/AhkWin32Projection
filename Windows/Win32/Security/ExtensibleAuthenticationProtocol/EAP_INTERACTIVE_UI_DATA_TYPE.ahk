#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the set of types of interactive UI context data supplied to certain supplicant API calls.
 * @remarks
 * The <b>EAP_INTERACTIVE_UI_DATA_TYPE</b> is used to support Single-Sign-On (SSO).
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ne-eaptypes-eap_interactive_ui_data_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_INTERACTIVE_UI_DATA_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
