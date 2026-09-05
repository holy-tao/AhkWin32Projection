#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_GROUP_STATUS flags indicate whether or not the peer group has connections present.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_group_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_GROUP_STATUS extends Win32Enum {

    /**
     * The peer group is awaiting new connections.
     * Native name: PEER_GROUP_STATUS_LISTENING
     * @type {Integer (Int32)}
     */
    static LISTENING => 1

    /**
     * The peer group has at least one connection.
     * Native name: PEER_GROUP_STATUS_HAS_CONNECTIONS
     * @type {Integer (Int32)}
     */
    static HAS_CONNECTIONS => 2
}
