#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store end points of a tunnel mode SA.
 * @remarks
 * 
  * For the unnamed union containing the local tunnel end point address, switch_type(FWP_IP_VERSION), switch_is(ipVersion).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoints1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TUNNEL_ENDPOINTS1 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * An [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) value that specifies the IP version. In tunnel mode, this is the version of the outer header.
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    localV4Address {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    localV6Address{
        get {
            if(!this.HasProp("__localV6AddressProxyArray"))
                this.__localV6AddressProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__localV6AddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    remoteV4Address {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    remoteV6Address{
        get {
            if(!this.HasProp("__remoteV6AddressProxyArray"))
                this.__remoteV6AddressProxyArray := Win32FixedArray(this.ptr + 24, 16, Primitive, "char")
            return this.__remoteV6AddressProxyArray
        }
    }

    /**
     * Optional LUID of the local interface corresponding to the local address specified above.
     * @type {Integer}
     */
    localIfLuid {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
