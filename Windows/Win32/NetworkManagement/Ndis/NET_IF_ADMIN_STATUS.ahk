#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NET_IF_ADMIN_STATUS enumeration type specifies the NDIS network interface administrative status, as described in RFC 2863.
 * @remarks
 * For more information on RFC 2863, see 
 *     <a href="https://www.ietf.org/rfc/rfc2863.txt">"The Interfaces Group MIB"</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ne-ifdef-net_if_admin_status
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NET_IF_ADMIN_STATUS extends Win32Enum {

    /**
     * Specifies that the interface is initialized and enabled, but the interface is not necessarily
     *      ready to transmit and receive network data because that depends on the operational status of the
     *      interface. For more information about the operational status of an interface, see 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/network/oid-gen-operational-status">OID_GEN_OPERATIONAL_STATUS</a>.
     * Native name: NET_IF_ADMIN_STATUS_UP
     * @type {Integer (Int32)}
     */
    static UP => 1

    /**
     * Specifies that the interface is down, and this interface cannot be used to transmit or receive
     *      network data.
     * Native name: NET_IF_ADMIN_STATUS_DOWN
     * @type {Integer (Int32)}
     */
    static DOWN => 2

    /**
     * Specifies that the interface is in a test mode, and no network data can be transmitted or
     *      received.
     * Native name: NET_IF_ADMIN_STATUS_TESTING
     * @type {Integer (Int32)}
     */
    static TESTING => 3
}
