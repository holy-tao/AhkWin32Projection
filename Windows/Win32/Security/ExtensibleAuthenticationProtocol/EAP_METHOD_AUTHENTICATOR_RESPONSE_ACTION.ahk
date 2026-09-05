#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of response instructions sent by the authenticator to the supplicant or EAP peer method.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ne-eapauthenticatoractiondefine-eap_method_authenticator_response_action
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
class EAP_METHOD_AUTHENTICATOR_RESPONSE_ACTION extends Win32Enum {

    /**
     * The supplicant should discard the response as it is not usable by EAPHost.
     * Native name: EAP_METHOD_AUTHENTICATOR_RESPONSE_DISCARD
     * @type {Integer (Int32)}
     */
    static DISCARD => 0

    /**
     * The supplicant should send the indicated packet to the authenticator.
     * Native name: EAP_METHOD_AUTHENTICATOR_RESPONSE_SEND
     * @type {Integer (Int32)}
     */
    static SEND => 1

    /**
     * The supplicant should act on EAP attributes returned by the authenticator.
     * Native name: EAP_METHOD_AUTHENTICATOR_RESPONSE_RESULT
     * @type {Integer (Int32)}
     */
    static RESULT => 2

    /**
     * The supplicant should generate a  context-specific response to the authenticator request.
     * Native name: EAP_METHOD_AUTHENTICATOR_RESPONSE_RESPOND
     * @type {Integer (Int32)}
     */
    static RESPOND => 3

    /**
     * The authenticator method has started authentication of the supplicant.
     * Native name: EAP_METHOD_AUTHENTICATOR_RESPONSE_AUTHENTICATE
     * @type {Integer (Int32)}
     */
    static AUTHENTICATE => 4

    /**
     * The peer method should return the handle for the user identity of the supplicant.
     * Native name: EAP_METHOD_AUTHENTICATOR_RESPONSE_HANDLE_IDENTITY
     * @type {Integer (Int32)}
     */
    static HANDLE_IDENTITY => 5
}
