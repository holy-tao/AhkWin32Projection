#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PEER_MEMBER_CHANGE_TYPE enumeration defines the set of possible peer group membership and presence states for a peer.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ne-p2p-peer_member_change_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_MEMBER_CHANGE_TYPE{

    /**
     * A member is connected to a peer group.
     * @type {Integer (Int32)}
     */
    static PEER_MEMBER_CONNECTED => 1

    /**
     * A member is disconnected from a peer group.
     * @type {Integer (Int32)}
     */
    static PEER_MEMBER_DISCONNECTED => 2

    /**
     * A member has updated information (for example, a new address) within a peer group.
     * @type {Integer (Int32)}
     */
    static PEER_MEMBER_UPDATED => 3

    /**
     * New membership information is published for a group member. The peer name of a peer group member is obtained from the <b>pwzIdentity</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_event_member_change_data">PEER_EVENT_MEMBER_CHANGE_DATA</a>  structure. New membership information is published in one of the following three scenarios: 
 * 
 * <ul>
 * <li>An administrator calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupissuecredentials">PeerGroupIssueCredentials</a> with the PEER_GROUP_STORE_CREDENTIALS flag set.</li>
 * <li>A user connects to a peer group for the first time, and the PEER_MEMBER_DATA_OPTIONAL flag is not set.</li>
 * <li>A peer group member performs an operation (for example, issuing an invitation or credentials, or publishing a record), but membership information for the peer group member does not exist in the group.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static PEER_MEMBER_JOINED => 4

    /**
     * This peer event does not exist in the Peer Grouping Infrastructure v1.0, and must not be used.
     * @type {Integer (Int32)}
     */
    static PEER_MEMBER_LEFT => 5
}
