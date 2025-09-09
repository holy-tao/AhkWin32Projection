#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the client network address of a Remote Desktop Services session.
 * @remarks
 * The client network address is reported by the RDP client itself when it connects to the server. This could be different than the address that actually connected to the server. For example, suppose there is a NAT between the client and the server. The client can report its own IP address, but the IP address that actually connects to the server is the NAT address. For VPN connections, the IP address might not be discoverable by the client. If it cannot be discovered, the client can report the only IP address it has, which may be the ISP assigned address. Because the address may not be the actual network address, it should not be used as a form of client authentication.
  *     
  * The client network address is also not available in the following cases:
  * - The connection is established through a Remote Desktop Gateway.
  * - The connection is originated by the **Microsoft Remote Desktop** app that is available in the Store.
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_client_address
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CLIENT_ADDRESS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Address family. This member can be <b>AF_INET</b>, <b>AF_INET6</b>, <b>AF_IPX</b>, <b>AF_NETBIOS</b>, or <b>AF_UNSPEC</b>.
     * @type {Integer}
     */
    AddressFamily {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Client network address. The format of the field of <b>Address</b> depends on the address type as specified by the <b>AddressFamily</b> member.
     * 
     * For an address family **AF_INET**: **Address** contains the IPV4 address of the client as raw byte values. The IP address is offset by two bytes from the start of the Address member. For example, the address 192.168.0.1 would be represented as the following series of byte values: "0x00 0x00 0xC0 0xA8 0x00 0x01".
     * 
     * 
     * For a family <b>AF_INET6</b>: <b>Address </b> contains the IPV6 address of the client as raw byte values. (For example, the address "FFFF::1" would be represented as the following series of byte values: "0xFF 0xFF 0x00 0x00  0x00 0x00  0x00 0x00  0x00 0x00  0x00 0x00  0x00 0x00  0x00 0x01")
     * @type {Array<Byte>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 4, 20, Primitive, "char")
            return this.__AddressProxyArray
        }
    }
}
