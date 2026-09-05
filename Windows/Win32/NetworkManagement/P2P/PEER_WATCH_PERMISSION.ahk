#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines whether a peer contact can receive presence updates from a contact.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_watch_permission
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_WATCH_PERMISSION extends Win32Enum {

    /**
     * The peer contact cannot receive presence updates.
     * Native name: PEER_WATCH_BLOCKED
     * @type {Integer (Int32)}
     */
    static BLOCKED => 0

    /**
     * The peer contact can receive presence updates.
     * Native name: PEER_WATCH_ALLOWED
     * @type {Integer (Int32)}
     */
    static ALLOWED => 1
}
