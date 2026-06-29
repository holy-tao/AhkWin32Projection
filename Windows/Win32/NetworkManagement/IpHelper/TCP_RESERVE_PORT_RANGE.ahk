#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TCP_RESERVE_PORT_RANGE structure specifies a TCP port range to reserve.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-tcp_reserve_port_range
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct TCP_RESERVE_PORT_RANGE {
    #StructPack 2

    /**
     * Value for the upper bound of the TCP port range to reserve.
     */
    UpperRange : UInt16

    /**
     * Value for the lower bound of the TCP port range to reserve.
     */
    LowerRange : UInt16

}
