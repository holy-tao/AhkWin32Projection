#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_COLLAB_EVENT_TYPE enumeration defines the set of events that can be raised on a peer by the peer collaboration network event infrastructure.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_collab_event_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_COLLAB_EVENT_TYPE extends Win32Enum {

    /**
     * The peer's list of watched contacts has changed.
     * Native name: PEER_EVENT_WATCHLIST_CHANGED
     * @type {Integer (Int32)}
     */
    static WATCHLIST_CHANGED => 1

    /**
     * The endpoint has changed.
     * Native name: PEER_EVENT_ENDPOINT_CHANGED
     * @type {Integer (Int32)}
     */
    static ENDPOINT_CHANGED => 2

    /**
     * The presence status of an endpoint has changed.
     * Native name: PEER_EVENT_ENDPOINT_PRESENCE_CHANGED
     * @type {Integer (Int32)}
     */
    static ENDPOINT_PRESENCE_CHANGED => 3

    /**
     * The registered application of the endpoint has changed.
     * Native name: PEER_EVENT_ENDPOINT_APPLICATION_CHANGED
     * @type {Integer (Int32)}
     */
    static ENDPOINT_APPLICATION_CHANGED => 4

    /**
     * A peer object registered to the endpoint has changed.
     * Native name: PEER_EVENT_ENDPOINT_OBJECT_CHANGED
     * @type {Integer (Int32)}
     */
    static ENDPOINT_OBJECT_CHANGED => 5

    /**
     * The local peer's endpoint has changed.
     * Native name: PEER_EVENT_MY_ENDPOINT_CHANGED
     * @type {Integer (Int32)}
     */
    static MY_ENDPOINT_CHANGED => 6

    /**
     * The local peer's presence status has changed.
     * Native name: PEER_EVENT_MY_PRESENCE_CHANGED
     * @type {Integer (Int32)}
     */
    static MY_PRESENCE_CHANGED => 7

    /**
     * The local peer's registered application has changed.
     * Native name: PEER_EVENT_MY_APPLICATION_CHANGED
     * @type {Integer (Int32)}
     */
    static MY_APPLICATION_CHANGED => 8

    /**
     * A peer object registered with the local peer has changed.
     * Native name: PEER_EVENT_MY_OBJECT_CHANGED
     * @type {Integer (Int32)}
     */
    static MY_OBJECT_CHANGED => 9

    /**
     * An endpoint in the same subnet as the local peer's endpoint has changed.
     * Native name: PEER_EVENT_PEOPLE_NEAR_ME_CHANGED
     * @type {Integer (Int32)}
     */
    static PEOPLE_NEAR_ME_CHANGED => 10

    /**
     * The status of a  request to refresh endpoint data or subscribe to endpoint data has changed.
     * Native name: PEER_EVENT_REQUEST_STATUS_CHANGED
     * @type {Integer (Int32)}
     */
    static REQUEST_STATUS_CHANGED => 11
}
