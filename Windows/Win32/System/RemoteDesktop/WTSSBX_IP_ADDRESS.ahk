#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the IP address of a network resource.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_ip_address
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_IP_ADDRESS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_address_family">WTSSBX_ADDRESS_FAMILY</a> enumeration type that indicates the address family of the network address.
     * @type {Integer}
     */
    AddressFamily {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The network address of the resource.
     * @type {Array<Byte>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__AddressProxyArray
        }
    }

    /**
     * The port number of the resource that is configured for Remote Desktop Protocol (RDP).
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The scope of the address. This member is used only for IPv6 addresses.
     * @type {Integer}
     */
    dwScope {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
