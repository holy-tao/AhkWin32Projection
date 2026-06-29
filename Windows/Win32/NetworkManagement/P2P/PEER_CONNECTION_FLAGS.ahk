#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_CONNECTION_FLAGS enumeration specifies the types of connections that a peer can have.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_connection_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_CONNECTION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies that a connection is a neighbor connection.
     * @type {Integer (Int32)}
     */
    static PEER_CONNECTION_NEIGHBOR => 1

    /**
     * Specifies that a connection is a direct connection to another node.
     * @type {Integer (Int32)}
     */
    static PEER_CONNECTION_DIRECT => 2
}
