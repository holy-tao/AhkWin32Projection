#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_CHANGE_TYPE enumeration defines the set of changes that were performed on a peer object, endpoint, or application in a peer event. It is used to qualify the peer event associated with the change type.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_change_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_CHANGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The peer object, endpoint, or application has been added.
     * @type {Integer (Int32)}
     */
    static PEER_CHANGE_ADDED => 0

    /**
     * The peer object, endpoint, or application has been deleted.
     * @type {Integer (Int32)}
     */
    static PEER_CHANGE_DELETED => 1

    /**
     * The peer object, endpoint, or application has been updated with new information.
     * @type {Integer (Int32)}
     */
    static PEER_CHANGE_UPDATED => 2
}
