#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PEER_RECORD_CHANGE_TYPE enumeration specifies the changes that can occur to a record.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_record_change_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_RECORD_CHANGE_TYPE{

    /**
     * Indicates that the specified record is added to the peer graph or group.
     * @type {Integer (Int32)}
     */
    static PEER_RECORD_ADDED => 1

    /**
     * Indicates that the specified record is updated in the peer graph or group.
     * @type {Integer (Int32)}
     */
    static PEER_RECORD_UPDATED => 2

    /**
     * Indicates that the specified record is deleted from the peer graph or group.
     * @type {Integer (Int32)}
     */
    static PEER_RECORD_DELETED => 3

    /**
     * Indicates that the specified record is expired and removed from the peer graph or group.
     * @type {Integer (Int32)}
     */
    static PEER_RECORD_EXPIRED => 4
}
