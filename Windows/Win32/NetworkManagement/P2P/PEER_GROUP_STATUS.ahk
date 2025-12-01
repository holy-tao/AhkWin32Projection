#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_GROUP_STATUS flags indicate whether or not the peer group has connections present.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_group_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GROUP_STATUS extends Win32Enum{

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
