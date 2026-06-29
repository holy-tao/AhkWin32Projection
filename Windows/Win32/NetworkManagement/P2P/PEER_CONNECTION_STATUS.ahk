#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_CONNECTION_STATUS enumeration specifies the status of a peer direct or neighbor connection.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_connection_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_CONNECTION_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The peer is connected to another peer.
     * @type {Integer (Int32)}
     */
    static PEER_CONNECTED => 1

    /**
     * The peer has disconnected from another peer.
     * @type {Integer (Int32)}
     */
    static PEER_DISCONNECTED => 2

    /**
     * The peer failed to connect to another peer.
     * @type {Integer (Int32)}
     */
    static PEER_CONNECTION_FAILED => 3
}
