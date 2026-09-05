#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of results of an EAP authentication session returned by an EAP authenticator method to an EAP peer method.
 * @remarks
 * <b>EapPeerMethodResultReason</b> includes <a href="https://docs.microsoft.com/windows/desktop/NLA/portal">network awareness</a> information for wireless devices.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ne-eapauthenticatoractiondefine-eappeermethodresultreason
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
class EapPeerMethodResultReason extends Win32Enum {

    /**
     * The success or failure of the authentication session is unknown or indeterminate.
     * Native name: EapPeerMethodResultUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Authentication was successful.
     * Native name: EapPeerMethodResultSuccess
     * @type {Integer (Int32)}
     */
    static Success => 2

    /**
     * Authentication failed.
     * Native name: EapPeerMethodResultFailure
     * @type {Integer (Int32)}
     */
    static Failure => 3
}
