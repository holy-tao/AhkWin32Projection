#Requires AutoHotkey v2.0.0 64-bit

/**
 * The PEER_PRESENCE_STATUS enumeration defines the set of possible presence status settings available to a peer that participates in a peer collaboration network.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ne-p2p-peer_presence_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_PRESENCE_STATUS{

    /**
     * The user is offline.
     * @type {Integer (Int32)}
     */
    static PEER_PRESENCE_OFFLINE => 0

    /**
     * The user is currently "out to lunch" and unable to respond.
     * @type {Integer (Int32)}
     */
    static PEER_PRESENCE_OUT_TO_LUNCH => 1

    /**
     * The user is away and unable to respond.
     * @type {Integer (Int32)}
     */
    static PEER_PRESENCE_AWAY => 2

    /**
     * The user has stepped away from the application and will participate soon.
     * @type {Integer (Int32)}
     */
    static PEER_PRESENCE_BE_RIGHT_BACK => 3

    /**
     * The user is idling.
     * @type {Integer (Int32)}
     */
    static PEER_PRESENCE_IDLE => 4

    /**
     * The user is busy and does not wish to be disturbed.
     * @type {Integer (Int32)}
     */
    static PEER_PRESENCE_BUSY => 5

    /**
     * The user is currently on the phone and does not wish to be disturbed.
     * @type {Integer (Int32)}
     */
    static PEER_PRESENCE_ON_THE_PHONE => 6

    /**
     * The user is actively participating in the peer collaboration network.
     * @type {Integer (Int32)}
     */
    static PEER_PRESENCE_ONLINE => 7
}
