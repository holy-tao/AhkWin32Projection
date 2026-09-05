#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_CONNECTION_FLAGS enumeration specifies the types of connections that a peer can have.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_connection_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_CONNECTION_FLAGS extends Win32Enum {

    /**
     * Specifies that a connection is a neighbor connection.
     * Native name: PEER_CONNECTION_NEIGHBOR
     * @type {Integer (Int32)}
     */
    static NEIGHBOR => 1

    /**
     * Specifies that a connection is a direct connection to another node.
     * Native name: PEER_CONNECTION_DIRECT
     * @type {Integer (Int32)}
     */
    static DIRECT => 2
}
