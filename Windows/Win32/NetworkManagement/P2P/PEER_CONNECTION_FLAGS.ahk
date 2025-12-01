#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_CONNECTION_FLAGS enumeration specifies the types of connections that a peer can have.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_connection_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_CONNECTION_FLAGS extends Win32Enum{

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
