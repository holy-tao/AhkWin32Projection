#Requires AutoHotkey v2.0.0 64-bit

/**
 * The IF_OPER_STATUS enumeration specifies the operational status of an interface.
 * @remarks
 * 
  * The <b>IF_OPER_STATUS</b> enumeration is used in the <b>OperStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a>  structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ifdef/ne-ifdef-if_oper_status
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class IF_OPER_STATUS{

    /**
     * The interface is up and operational. The interface is able to pass packets.
     * @type {Integer (Int32)}
     */
    static IfOperStatusUp => 1

    /**
     * The interface is not down and not operational. The interface is unable to pass packets.
     * @type {Integer (Int32)}
     */
    static IfOperStatusDown => 2

    /**
     * The interface is being tested.
     * @type {Integer (Int32)}
     */
    static IfOperStatusTesting => 3

    /**
     * The interface status is unknown.
     * @type {Integer (Int32)}
     */
    static IfOperStatusUnknown => 4

    /**
     * The interface is not
 *    in a condition to pass packets. The interface is  not up, but is
 *    in a pending state, waiting for some external event.  This state identifies the situation where the
 *    interface is waiting for events to place it in the up state.
     * @type {Integer (Int32)}
     */
    static IfOperStatusDormant => 5

    /**
     * This state is a refinement on the down state which
 *    indicates that the interface is down specifically because
 *    some component (for example, a hardware component) is not present in
 *    the system.
     * @type {Integer (Int32)}
     */
    static IfOperStatusNotPresent => 6

    /**
     * This state is a refinement on the down state.
 *    The interface is operational, but a networking layer below the interface is not operational.
     * @type {Integer (Int32)}
     */
    static IfOperStatusLowerLayerDown => 7
}
