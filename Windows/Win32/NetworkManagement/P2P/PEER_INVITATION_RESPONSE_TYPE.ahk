#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the type of response received to an invitation to start a Peer Collaboration activity.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_invitation_response_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_INVITATION_RESPONSE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The invitation was declined by the peer.
     * @type {Integer (Int32)}
     */
    static PEER_INVITATION_RESPONSE_DECLINED => 0

    /**
     * The invitation was accepted by the peer.
     * @type {Integer (Int32)}
     */
    static PEER_INVITATION_RESPONSE_ACCEPTED => 1

    /**
     * The invitation has expired.
     * @type {Integer (Int32)}
     */
    static PEER_INVITATION_RESPONSE_EXPIRED => 2

    /**
     * An error occurred during the invitation process.
     * @type {Integer (Int32)}
     */
    static PEER_INVITATION_RESPONSE_ERROR => 3
}
