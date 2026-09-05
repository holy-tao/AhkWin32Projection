#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of actions an EAP authenticator or peer method can indicate to a supplicant during authentication.
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
class EapHostPeerResponseAction extends Win32Enum {

    /**
     * The supplicant should discard the request as it is not usable by EAP.
     * Native name: EapHostPeerResponseDiscard
     * @type {Integer (Int32)}
     */
    static Discard => 0

    /**
     * The supplicant should send the indicated packet to the authenticator.
     * Native name: EapHostPeerResponseSend
     * @type {Integer (Int32)}
     */
    static Send => 1

    /**
     * The supplicant should act on EAP attributes returned by the EAP authenticator.
     * Native name: EapHostPeerResponseResult
     * @type {Integer (Int32)}
     */
    static Result => 2

    /**
     * The supplicant should invoke a user interface dialog on the client.
     * Native name: EapHostPeerResponseInvokeUi
     * @type {Integer (Int32)}
     */
    static InvokeUi => 3

    /**
     * The supplicant should generate a  context-specific response to the EAP authenticator request.
     * Native name: EapHostPeerResponseRespond
     * @type {Integer (Int32)}
     */
    static Respond => 4

    /**
     * The EAPHost has started authentication.
     * Native name: EapHostPeerResponseStartAuthentication
     * @type {Integer (Int32)}
     */
    static StartAuthentication => 5

    /**
     * The supplicant should generate no  response to the EAP authenticator request.
     * Native name: EapHostPeerResponseNone
     * @type {Integer (Int32)}
     */
    static None => 6
}
