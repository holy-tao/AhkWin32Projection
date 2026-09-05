#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of actions an EAP authenticator can indicate to a supplicant or EAP peer method during authentication.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ne-eapauthenticatoractiondefine-eappeermethodresponseaction
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
class EapPeerMethodResponseAction extends Win32Enum {

    /**
     * The supplicant should discard the request as it is not usable by EAP.
     * Native name: EapPeerMethodResponseActionDiscard
     * @type {Integer (Int32)}
     */
    static Discard => 0

    /**
     * The supplicant should send the indicated packet to the authenticator.
     * Native name: EapPeerMethodResponseActionSend
     * @type {Integer (Int32)}
     */
    static Send => 1

    /**
     * The supplicant should act on EAP attributes returned by the EAP authenticator.
     * Native name: EapPeerMethodResponseActionResult
     * @type {Integer (Int32)}
     */
    static Result => 2

    /**
     * The EAP peer method should invoke a user interface dialog on the client.
     * Native name: EapPeerMethodResponseActionInvokeUI
     * @type {Integer (Int32)}
     */
    static InvokeUI => 3

    /**
     * The supplicant should generate a  context-specific response to the EAP authenticator request.
     * Native name: EapPeerMethodResponseActionRespond
     * @type {Integer (Int32)}
     */
    static Respond => 4

    /**
     * The supplicant should generate no  response to the EAP authenticator request.
     * Native name: EapPeerMethodResponseActionNone
     * @type {Integer (Int32)}
     */
    static None => 5
}
