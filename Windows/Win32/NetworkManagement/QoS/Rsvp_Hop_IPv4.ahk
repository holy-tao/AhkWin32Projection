#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk

/**
 * The Rsvp_Hop_IPv4 structure stores information about an RSVP-enabled IPv4 hop.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-rsvp_hop_ipv4
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class Rsvp_Hop_IPv4 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The next or previous hop IP address, in the form of an <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-in_addr">in_addr</a> structure.
     * @type {IN_ADDR}
     */
    hop_ipaddr{
        get {
            if(!this.HasProp("__hop_ipaddr"))
                this.__hop_ipaddr := IN_ADDR(this.ptr + 0)
            return this.__hop_ipaddr
        }
    }

    /**
     * Logical Interface Handle.
     * @type {Integer}
     */
    hop_LIH {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
