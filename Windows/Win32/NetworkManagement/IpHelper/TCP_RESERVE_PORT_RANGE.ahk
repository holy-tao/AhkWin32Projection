#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TCP_RESERVE_PORT_RANGE structure specifies a TCP port range to reserve.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-tcp_reserve_port_range
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_RESERVE_PORT_RANGE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Value for the upper bound of the TCP port range to reserve.
     * @type {Integer}
     */
    UpperRange {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Value for the lower bound of the TCP port range to reserve.
     * @type {Integer}
     */
    LowerRange {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
