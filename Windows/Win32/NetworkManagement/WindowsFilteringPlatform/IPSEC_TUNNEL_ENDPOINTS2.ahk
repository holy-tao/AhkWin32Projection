#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used to store end points of a tunnel mode SA. (IPSEC_TUNNEL_ENDPOINTS2)
 * @remarks
 * For the unnamed union containing the local tunnel end point address, switch_type(FWP_IP_VERSION), switch_is(ipVersion).
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoints2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TUNNEL_ENDPOINTS2 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version)</b>
     * 
     * Specifies the IP version. In tunnel mode, this is the version of the outer header.
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
     * Type: <b>UINT64</b>
     * 
     * Optional LUID of the local interface corresponding to the local address specified above.
     * @type {Integer}
     */
    localIfLuid {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>wchar_t*</b>
     * 
     * Configuration of multiple remote addresses and fully qualified domain names  for asymmetric tunneling support.
     * @type {PWSTR}
     */
    remoteFqdn {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of remote tunnel addresses.
     * @type {Integer}
     */
    numAddresses {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: [IPSEC_TUNNEL_ENDPOINT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoint0)*</b>
     * 
     * [size_is(numAddresses)]
     * 
     * The remote tunnel end point address information.
     * @type {Pointer<IPSEC_TUNNEL_ENDPOINT0>}
     */
    remoteAddresses {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
