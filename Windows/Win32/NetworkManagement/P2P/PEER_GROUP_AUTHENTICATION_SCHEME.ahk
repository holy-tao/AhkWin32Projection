#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of possible authentication schemes that can be used to authenticate peers joining a peer group.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_group_authentication_scheme
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_GROUP_AUTHENTICATION_SCHEME {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Authentication is performed using Group Membership Certificates (GMC).
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_GMC_AUTHENTICATION => 1

    /**
     * Authentication is performed by validating a provided password.
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_PASSWORD_AUTHENTICATION => 2
}
