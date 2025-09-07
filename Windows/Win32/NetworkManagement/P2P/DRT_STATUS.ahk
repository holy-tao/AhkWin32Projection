#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DRT_STATUS enumeration defines the status of a local DRT instance.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ne-drt-drt_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_STATUS{

    /**
     * The local node is connected to the DRT mesh and participating in the DRT system. This is also an indication that remote nodes exist and are present in the cache of the local node.
     * @type {Integer (Int32)}
     */
    static DRT_ACTIVE => 0

    /**
     * The local node is participating in the DRT system, but is waiting for remote nodes to join the DRT mesh. This is an indication that remote nodes do not exist, or are not yet present in the cache of the local node.
     * @type {Integer (Int32)}
     */
    static DRT_ALONE => 1

    /**
     * The local node does not have network connectivity.
     * @type {Integer (Int32)}
     */
    static DRT_NO_NETWORK => 10

    /**
     * A critical error has occurred in the local DRT instance. The <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtclose">DrtClose</a> function must be called, after which  an attempt to re-open the DRT can be made.
     * @type {Integer (Int32)}
     */
    static DRT_FAULTED => 20
}
