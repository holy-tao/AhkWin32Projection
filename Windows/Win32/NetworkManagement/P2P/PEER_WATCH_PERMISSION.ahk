#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines whether a peer contact can receive presence updates from a contact.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_watch_permission
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_WATCH_PERMISSION{

    /**
     * The peer contact cannot receive presence updates.
     * @type {Integer (Int32)}
     */
    static PEER_WATCH_BLOCKED => 0

    /**
     * The peer contact can receive presence updates.
     * @type {Integer (Int32)}
     */
    static PEER_WATCH_ALLOWED => 1
}
