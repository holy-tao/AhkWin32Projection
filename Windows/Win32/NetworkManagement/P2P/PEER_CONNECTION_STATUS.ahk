#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_CONNECTION_STATUS enumeration specifies the status of a peer direct or neighbor connection.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_connection_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_CONNECTION_STATUS extends Win32Enum {

    /**
     * The peer is connected to another peer.
     * Native name: PEER_CONNECTED
     * @type {Integer (Int32)}
     */
    static CONNECTED => 1

    /**
     * The peer has disconnected from another peer.
     * Native name: PEER_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 2

    /**
     * The peer failed to connect to another peer.
     * Native name: PEER_CONNECTION_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 3
}
