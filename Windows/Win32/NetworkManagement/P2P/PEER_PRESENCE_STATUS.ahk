#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_PRESENCE_STATUS enumeration defines the set of possible presence status settings available to a peer that participates in a peer collaboration network.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_presence_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_PRESENCE_STATUS extends Win32Enum {

    /**
     * The user is offline.
     * Native name: PEER_PRESENCE_OFFLINE
     * @type {Integer (Int32)}
     */
    static OFFLINE => 0

    /**
     * The user is currently "out to lunch" and unable to respond.
     * Native name: PEER_PRESENCE_OUT_TO_LUNCH
     * @type {Integer (Int32)}
     */
    static OUT_TO_LUNCH => 1

    /**
     * The user is away and unable to respond.
     * Native name: PEER_PRESENCE_AWAY
     * @type {Integer (Int32)}
     */
    static AWAY => 2

    /**
     * The user has stepped away from the application and will participate soon.
     * Native name: PEER_PRESENCE_BE_RIGHT_BACK
     * @type {Integer (Int32)}
     */
    static BE_RIGHT_BACK => 3

    /**
     * The user is idling.
     * Native name: PEER_PRESENCE_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 4

    /**
     * The user is busy and does not wish to be disturbed.
     * Native name: PEER_PRESENCE_BUSY
     * @type {Integer (Int32)}
     */
    static BUSY => 5

    /**
     * The user is currently on the phone and does not wish to be disturbed.
     * Native name: PEER_PRESENCE_ON_THE_PHONE
     * @type {Integer (Int32)}
     */
    static ON_THE_PHONE => 6

    /**
     * The user is actively participating in the peer collaboration network.
     * Native name: PEER_PRESENCE_ONLINE
     * @type {Integer (Int32)}
     */
    static ONLINE => 7
}
