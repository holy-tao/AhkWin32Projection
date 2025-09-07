#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines a set of possible input field types available when querying for user credentials.
 * @remarks
 * The <b>EAP_CONFIG_INPUT_FIELD_TYPE</b> enumeration can be employed to support Single-Sign-On (SSO).
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ne-eaptypes-eap_config_input_field_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_CONFIG_INPUT_FIELD_TYPE{

    /**
     * The input field contains a user's application logon name.
     * @type {Integer (Int32)}
     */
    static EapConfigInputUsername => 0

    /**
     * The input field contains a user's application logon password.
     * @type {Integer (Int32)}
     */
    static EapConfigInputPassword => 1

    /**
     * The input field contains a user's network logon name. This is used as an alternate logon user name for <b>EapConfigInputUsername</b>.
     * @type {Integer (Int32)}
     */
    static EapConfigInputNetworkUsername => 2

    /**
     * The input field contains a user's network login password. This is used as an alternate logon password for <b>EapConfigInputPassword</b>.
     * @type {Integer (Int32)}
     */
    static EapConfigInputNetworkPassword => 3

    /**
     * The input field contains the user's network access PIN.
     * @type {Integer (Int32)}
     */
    static EapConfigInputPin => 4

    /**
     * The input field contains the user's Flexible Authentication via Secure Tunneling (EAP-FAST) Pre-Shared Key(PSK).
     * @type {Integer (Int32)}
     */
    static EapConfigInputPSK => 5

    /**
     * The input field contains a generic logon token string.
     * @type {Integer (Int32)}
     */
    static EapConfigInputEdit => 6

    /**
     * Windows 7 or later: The input field contains the username from a  smartcard certificate.
     * @type {Integer (Int32)}
     */
    static EapConfigSmartCardUsername => 7

    /**
     * Windows 7 or later: If an authentication using a smartcard did not succeed in the previous attempt of the current session, this input field contains an error message citing the failure reason.
     * @type {Integer (Int32)}
     */
    static EapConfigSmartCardError => 8
}
