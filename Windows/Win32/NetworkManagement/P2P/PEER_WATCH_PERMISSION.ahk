#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines whether a peer contact can receive presence updates from a contact.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_watch_permission
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_WATCH_PERMISSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
