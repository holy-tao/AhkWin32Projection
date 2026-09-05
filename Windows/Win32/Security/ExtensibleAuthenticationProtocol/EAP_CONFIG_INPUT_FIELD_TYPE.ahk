#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines a set of possible input field types available when querying for user credentials.
 * @remarks
 * The <b>EAP_CONFIG_INPUT_FIELD_TYPE</b> enumeration can be employed to support Single-Sign-On (SSO).
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ne-eaptypes-eap_config_input_field_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
class EAP_CONFIG_INPUT_FIELD_TYPE extends Win32Enum {

    /**
     * The input field contains a user's application logon name.
     * Native name: EapConfigInputUsername
     * @type {Integer (Int32)}
     */
    static Username => 0

    /**
     * The input field contains a user's application logon password.
     * Native name: EapConfigInputPassword
     * @type {Integer (Int32)}
     */
    static Password => 1

    /**
     * The input field contains a user's network logon name. This is used as an alternate logon user name for <b>EapConfigInputUsername</b>.
     * Native name: EapConfigInputNetworkUsername
     * @type {Integer (Int32)}
     */
    static NetworkUsername => 2

    /**
     * The input field contains a user's network login password. This is used as an alternate logon password for <b>EapConfigInputPassword</b>.
     * Native name: EapConfigInputNetworkPassword
     * @type {Integer (Int32)}
     */
    static NetworkPassword => 3

    /**
     * The input field contains the user's network access PIN.
     * Native name: EapConfigInputPin
     * @type {Integer (Int32)}
     */
    static Pin => 4

    /**
     * The input field contains the user's Flexible Authentication via Secure Tunneling (EAP-FAST) Pre-Shared Key(PSK).
     * Native name: EapConfigInputPSK
     * @type {Integer (Int32)}
     */
    static InputPSK => 5

    /**
     * The input field contains a generic logon token string.
     * Native name: EapConfigInputEdit
     * @type {Integer (Int32)}
     */
    static Edit => 6

    /**
     * Windows 7 or later: The input field contains the username from a  smartcard certificate.
     * Native name: EapConfigSmartCardUsername
     * @type {Integer (Int32)}
     */
    static SmartCardUsername => 7

    /**
     * Windows 7 or later: If an authentication using a smartcard did not succeed in the previous attempt of the current session, this input field contains an error message citing the failure reason.
     * Native name: EapConfigSmartCardError
     * @type {Integer (Int32)}
     */
    static SmartCardError => 8
}
