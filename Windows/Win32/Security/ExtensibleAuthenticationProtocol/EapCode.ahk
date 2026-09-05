#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of EAP packet types.
 * @see https://learn.microsoft.com/windows/win32/api/eapmethodtypes/ne-eapmethodtypes-eapcode
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
class EapCode extends Win32Enum {

    /**
     * The lowest possible value for an EAP packet type code.
     * Native name: EapCodeMinimum
     * @type {Integer (Int32)}
     */
    static Minimum => 1

    /**
     * A request packet sent by the authenticator to the supplicant.
     * Native name: EapCodeRequest
     * @type {Integer (Int32)}
     */
    static Request => 1

    /**
     * A response packet sent by the supplicant to the authenticator.
     * Native name: EapCodeResponse
     * @type {Integer (Int32)}
     */
    static Response => 2

    /**
     * A successful authentication attempt.
     * Native name: EapCodeSuccess
     * @type {Integer (Int32)}
     */
    static Success => 3

    /**
     * A failed authentication attempt.
     * Native name: EapCodeFailure
     * @type {Integer (Int32)}
     */
    static Failure => 4

    /**
     * The highest possible value for an EAP packet type code.
     * Native name: EapCodeMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 4
}
