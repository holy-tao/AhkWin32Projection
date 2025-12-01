#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of actions an EAP authenticator can indicate to a supplicant or EAP peer method during authentication.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ne-eapauthenticatoractiondefine-eappeermethodresponseaction
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapPeerMethodResponseAction extends Win32Enum{

    /**
     * The supplicant should discard the request as it is not usable by EAP.
     * @type {Integer (Int32)}
     */
    static EapPeerMethodResponseActionDiscard => 0

    /**
     * The supplicant should send the indicated packet to the authenticator.
     * @type {Integer (Int32)}
     */
    static EapPeerMethodResponseActionSend => 1

    /**
     * The supplicant should act on EAP attributes returned by the EAP authenticator.
     * @type {Integer (Int32)}
     */
    static EapPeerMethodResponseActionResult => 2

    /**
     * The EAP peer method should invoke a user interface dialog on the client.
     * @type {Integer (Int32)}
     */
    static EapPeerMethodResponseActionInvokeUI => 3

    /**
     * The supplicant should generate a  context-specific response to the EAP authenticator request.
     * @type {Integer (Int32)}
     */
    static EapPeerMethodResponseActionRespond => 4

    /**
     * The supplicant should generate no  response to the EAP authenticator request.
     * @type {Integer (Int32)}
     */
    static EapPeerMethodResponseActionNone => 5
}
