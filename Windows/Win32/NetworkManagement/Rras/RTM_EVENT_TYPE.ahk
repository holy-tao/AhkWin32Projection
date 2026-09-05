#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RTM_EVENT_TYPE enumeration enumerates the events that the routing table manager can notify the client about using the RTM_EVENT_CALLBACK callback.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ne-rtmv2-rtm_event_type
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class RTM_EVENT_TYPE extends Win32Enum {

    /**
     * A client has just registered with the routing table manager.
     * Native name: RTM_ENTITY_REGISTERED
     * @type {Integer (Int32)}
     */
    static ENTITY_REGISTERED => 0

    /**
     * A client has just unregistered.
     * Native name: RTM_ENTITY_DEREGISTERED
     * @type {Integer (Int32)}
     */
    static ENTITY_DEREGISTERED => 1

    /**
     * A route has timed out.
     * Native name: RTM_ROUTE_EXPIRED
     * @type {Integer (Int32)}
     */
    static ROUTE_EXPIRED => 2

    /**
     * A change notification has been made.
     * Native name: RTM_CHANGE_NOTIFICATION
     * @type {Integer (Int32)}
     */
    static CHANGE_NOTIFICATION => 3
}
