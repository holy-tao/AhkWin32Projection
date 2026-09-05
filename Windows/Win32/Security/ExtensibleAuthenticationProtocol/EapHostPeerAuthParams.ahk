#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of possible authentication parameter values.
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerauthparams
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
class EapHostPeerAuthParams extends Win32Enum {

    /**
     * Contains the current status of authentication for the supplicant.
     * Native name: EapHostPeerAuthStatus
     * @type {Integer (Int32)}
     */
    static Status => 1

    /**
     * Contains the user identity of the supplicant.
     * Native name: EapHostPeerIdentity
     * @type {Integer (Int32)}
     */
    static Identity => 2

    /**
     * Contains extended user identity information for the supplicant from the identity packet.
     * Native name: EapHostPeerIdentityExtendedInfo
     * @type {Integer (Int32)}
     */
    static IdentityExtendedInfo => 3

    /**
     * Windows 7 or later: Contains NAP-related information for the supplicant in an [EapHostPeerNapInfo](/windows/win32/eaphost/eaphostpeernapinfo) structure.
     * Native name: EapHostNapInfo
     * @type {Integer (Int32)}
     */
    static NapInfo => 4
}
