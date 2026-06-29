#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_GROUP_STATUS flags indicate whether or not the peer group has connections present.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_group_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_GROUP_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The peer group is awaiting new connections.
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_STATUS_LISTENING => 1

    /**
     * The peer group has at least one connection.
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_STATUS_HAS_CONNECTIONS => 2
}
