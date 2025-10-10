#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DRT_EVENT_TYPE enumeration defines the set of events that can be raised by the Distributed Routing Table.
 * @remarks
 * 
  * The event handle passed to <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a> is signaled with an event  specified by the <b>DRT_EVENT_TYPE</b> enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//drt/ne-drt-drt_event_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_EVENT_TYPE{

    /**
     * The status of the local DRT instance has changed.
     * @type {Integer (Int32)}
     */
    static DRT_EVENT_STATUS_CHANGED => 0

    /**
     * A key or node was changed from the DRT leaf set of the local node.
     * @type {Integer (Int32)}
     */
    static DRT_EVENT_LEAFSET_KEY_CHANGED => 1

    /**
     * A locally published key is no longer resolvable by other nodes.
     * @type {Integer (Int32)}
     */
    static DRT_EVENT_REGISTRATION_STATE_CHANGED => 2
}
