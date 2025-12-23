#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of response instructions sent by the authenticator to the supplicant or EAP peer method.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ne-eapauthenticatoractiondefine-eap_method_authenticator_response_action
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_AUTHENTICATOR_RESPONSE_ACTION extends Win32Enum{

    /**
     * The supplicant should discard the response as it is not usable by EAPHost.
     * @type {Integer (Int32)}
     */
    static EAP_METHOD_AUTHENTICATOR_RESPONSE_DISCARD => 0

    /**
     * The supplicant should send the indicated packet to the authenticator.
     * @type {Integer (Int32)}
     */
    static EAP_METHOD_AUTHENTICATOR_RESPONSE_SEND => 1

    /**
     * The supplicant should act on EAP attributes returned by the authenticator.
     * @type {Integer (Int32)}
     */
    static EAP_METHOD_AUTHENTICATOR_RESPONSE_RESULT => 2

    /**
     * The supplicant should generate a  context-specific response to the authenticator request.
     * @type {Integer (Int32)}
     */
    static EAP_METHOD_AUTHENTICATOR_RESPONSE_RESPOND => 3

    /**
     * The authenticator method has started authentication of the supplicant.
     * @type {Integer (Int32)}
     */
    static EAP_METHOD_AUTHENTICATOR_RESPONSE_AUTHENTICATE => 4

    /**
     * The peer method should return the handle for the user identity of the supplicant.
     * @type {Integer (Int32)}
     */
    static EAP_METHOD_AUTHENTICATOR_RESPONSE_HANDLE_IDENTITY => 5
}
