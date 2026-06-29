#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of possible authentication parameter values.
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerauthparams
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapHostPeerAuthParams {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Contains the current status of authentication for the supplicant.
     * @type {Integer (Int32)}
     */
    static EapHostPeerAuthStatus => 1

    /**
     * Contains the user identity of the supplicant.
     * @type {Integer (Int32)}
     */
    static EapHostPeerIdentity => 2

    /**
     * Contains extended user identity information for the supplicant from the identity packet.
     * @type {Integer (Int32)}
     */
    static EapHostPeerIdentityExtendedInfo => 3

    /**
     * Windows 7 or later: Contains NAP-related information for the supplicant in an [EapHostPeerNapInfo](/windows/win32/eaphost/eaphostpeernapinfo) structure.
     * @type {Integer (Int32)}
     */
    static EapHostNapInfo => 4
}
