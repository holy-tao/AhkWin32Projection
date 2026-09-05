#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of response received to an invitation to start a Peer Collaboration activity.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_invitation_response_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_INVITATION_RESPONSE_TYPE extends Win32Enum {

    /**
     * The invitation was declined by the peer.
     * Native name: PEER_INVITATION_RESPONSE_DECLINED
     * @type {Integer (Int32)}
     */
    static DECLINED => 0

    /**
     * The invitation was accepted by the peer.
     * Native name: PEER_INVITATION_RESPONSE_ACCEPTED
     * @type {Integer (Int32)}
     */
    static ACCEPTED => 1

    /**
     * The invitation has expired.
     * Native name: PEER_INVITATION_RESPONSE_EXPIRED
     * @type {Integer (Int32)}
     */
    static EXPIRED => 2

    /**
     * An error occurred during the invitation process.
     * Native name: PEER_INVITATION_RESPONSE_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 3
}
