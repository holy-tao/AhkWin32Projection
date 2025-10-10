#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PEER_RECORD_FLAGS enumeration specifies a set of flags for peer record behaviors.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ne-p2p-peer_record_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_RECORD_FLAGS{

    /**
     * The peer record must be automatically refreshed any time an event for the record is raised.
     * @type {Integer (Int32)}
     */
    static PEER_RECORD_FLAG_AUTOREFRESH => 1

    /**
     * The peer record is marked for deletion but has not yet been physically removed from the local computer.
     * @type {Integer (Int32)}
     */
    static PEER_RECORD_FLAG_DELETED => 2
}
