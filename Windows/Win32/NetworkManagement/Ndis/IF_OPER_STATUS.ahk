#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The IF_OPER_STATUS enumeration specifies the operational status of an interface.
 * @remarks
 * The <b>IF_OPER_STATUS</b> enumeration is used in the <b>OperStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/iptypes/ns-iptypes-ip_adapter_addresses_lh">IP_ADAPTER_ADDRESSES</a>  structure.
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ne-ifdef-if_oper_status
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class IF_OPER_STATUS extends Win32Enum {

    /**
     * The interface is up and operational. The interface is able to pass packets.
     * Native name: IfOperStatusUp
     * @type {Integer (Int32)}
     */
    static Up => 1

    /**
     * The interface is not down and not operational. The interface is unable to pass packets.
     * Native name: IfOperStatusDown
     * @type {Integer (Int32)}
     */
    static Down => 2

    /**
     * The interface is being tested.
     * Native name: IfOperStatusTesting
     * @type {Integer (Int32)}
     */
    static Testing => 3

    /**
     * The interface status is unknown.
     * Native name: IfOperStatusUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 4

    /**
     * The interface is not
     *    in a condition to pass packets. The interface is  not up, but is
     *    in a pending state, waiting for some external event.  This state identifies the situation where the
     *    interface is waiting for events to place it in the up state.
     * Native name: IfOperStatusDormant
     * @type {Integer (Int32)}
     */
    static Dormant => 5

    /**
     * This state is a refinement on the down state which
     *    indicates that the interface is down specifically because
     *    some component (for example, a hardware component) is not present in
     *    the system.
     * Native name: IfOperStatusNotPresent
     * @type {Integer (Int32)}
     */
    static NotPresent => 6

    /**
     * This state is a refinement on the down state.
     *    The interface is operational, but a networking layer below the interface is not operational.
     * Native name: IfOperStatusLowerLayerDown
     * @type {Integer (Int32)}
     */
    static LowerLayerDown => 7
}
