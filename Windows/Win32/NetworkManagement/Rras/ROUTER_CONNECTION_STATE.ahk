#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the possible states of an interface on a router.
 * @remarks
 * These states are sometimes referred to as <i>operational states</i>.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ne-mprapi-router_connection_state
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class ROUTER_CONNECTION_STATE{

    /**
     * The interface is unreachable. For a list of possible reasons, see 
 * <a href="https://docs.microsoft.com/windows/desktop/RRAS/unreachability-reasons">Unreachability Reasons</a>.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_STATE_UNREACHABLE => 0

    /**
     * The interface is reachable but disconnected.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_STATE_DISCONNECTED => 1

    /**
     * The interface is in the process of connecting.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_STATE_CONNECTING => 2

    /**
     * The interface is connected.
     * @type {Integer (Int32)}
     */
    static ROUTER_IF_STATE_CONNECTED => 3
}
