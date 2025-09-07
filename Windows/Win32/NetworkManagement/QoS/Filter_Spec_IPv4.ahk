#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk

/**
 * The Filter_Spec_IPv4 structure contains information about an IPv4 FILTERSPEC.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-filter_spec_ipv4
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class Filter_Spec_IPv4 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * IP address of the source address, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-in_addr">in_addr</a> structure.
     * @type {IN_ADDR}
     */
    filt_ipaddr{
        get {
            if(!this.HasProp("__filt_ipaddr"))
                this.__filt_ipaddr := IN_ADDR(this.ptr + 0)
            return this.__filt_ipaddr
        }
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    filt_unused {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * TCP port for the source.
     * @type {Integer}
     */
    filt_port {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
