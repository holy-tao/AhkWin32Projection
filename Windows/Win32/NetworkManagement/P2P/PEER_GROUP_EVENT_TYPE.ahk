#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_GROUP_EVENT_TYPE enumeration contains the specific peer event types that can occur within a peer group.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ne-p2p-peer_group_event_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GROUP_EVENT_TYPE extends Win32Enum{

    /**
     * The status of the group has changed. This peer event is fired when one of the flags listed in the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_status">PEER_GROUP_STATUS</a> enumeration are set or changed for the group.
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_EVENT_STATUS_CHANGED => 1

    /**
     * A member in the [PEER_GROUP_EVENT_DATA](/windows/win32/api/p2p/ns-p2p-peer_group_event_data-r1) to retrieve.
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_EVENT_PROPERTY_CHANGED => 2

    /**
     * A group record has changed. Information on this change is provided in the [PEER_GROUP_EVENT_DATA](/windows/win32/api/p2p/ns-p2p-peer_group_event_data-r1).
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_EVENT_RECORD_CHANGED => 3

    /**
     * The status of a direct connection has changed. Information on this change is provided in the [PEER_GROUP_EVENT_DATA](/windows/win32/api/p2p/ns-p2p-peer_group_event_data-r1).
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_EVENT_DIRECT_CONNECTION => 4

    /**
     * The status of a neighbor connection has changed. Information on this change is provided in the [PEER_GROUP_EVENT_DATA](/windows/win32/api/p2p/ns-p2p-peer_group_event_data-r1).
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_EVENT_NEIGHBOR_CONNECTION => 5

    /**
     * Incoming direct connection data from a member is detected. Information on this peer event is provided in the [PEER_GROUP_EVENT_DATA](/windows/win32/api/p2p/ns-p2p-peer_group_event_data-r1).
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_EVENT_INCOMING_DATA => 6

    /**
     * The status of a member has changed. Information on this change is provided in the [PEER_GROUP_EVENT_DATA](/windows/win32/api/p2p/ns-p2p-peer_group_event_data-r1).
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_EVENT_MEMBER_CHANGED => 8

    /**
     * The connection to the peer group has failed. No data is provided when this peer event is raised. This event is also raised if no members are online in a group you are attempting to connect to for the first time.
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_EVENT_CONNECTION_FAILED => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_EVENT_AUTHENTICATION_FAILED => 11
}
