#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of actions an EAP authenticator or peer method can indicate to a supplicant during authentication.
 * @see https://docs.microsoft.com/windows/win32/api//eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapHostPeerResponseAction extends Win32Enum{

    /**
     * The supplicant should discard the request as it is not usable by EAP.
     * @type {Integer (Int32)}
     */
    static EapHostPeerResponseDiscard => 0

    /**
     * The supplicant should send the indicated packet to the authenticator.
     * @type {Integer (Int32)}
     */
    static EapHostPeerResponseSend => 1

    /**
     * The supplicant should act on EAP attributes returned by the EAP authenticator.
     * @type {Integer (Int32)}
     */
    static EapHostPeerResponseResult => 2

    /**
     * The supplicant should invoke a user interface dialog on the client.
     * @type {Integer (Int32)}
     */
    static EapHostPeerResponseInvokeUi => 3

    /**
     * The supplicant should generate a  context-specific response to the EAP authenticator request.
     * @type {Integer (Int32)}
     */
    static EapHostPeerResponseRespond => 4

    /**
     * The EAPHost has started authentication.
     * @type {Integer (Int32)}
     */
    static EapHostPeerResponseStartAuthentication => 5

    /**
     * The supplicant should generate no  response to the EAP authenticator request.
     * @type {Integer (Int32)}
     */
    static EapHostPeerResponseNone => 6
}
