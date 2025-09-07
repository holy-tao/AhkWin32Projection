#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RTM_EVENT_TYPE enumeration enumerates the events that the routing table manager can notify the client about using the RTM_EVENT_CALLBACK callback.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ne-rtmv2-rtm_event_type
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_EVENT_TYPE{

    /**
     * A client has just registered with the routing table manager.
     * @type {Integer (Int32)}
     */
    static RTM_ENTITY_REGISTERED => 0

    /**
     * A client has just unregistered.
     * @type {Integer (Int32)}
     */
    static RTM_ENTITY_DEREGISTERED => 1

    /**
     * A route has timed out.
     * @type {Integer (Int32)}
     */
    static RTM_ROUTE_EXPIRED => 2

    /**
     * A change notification has been made.
     * @type {Integer (Int32)}
     */
    static RTM_CHANGE_NOTIFICATION => 3
}
