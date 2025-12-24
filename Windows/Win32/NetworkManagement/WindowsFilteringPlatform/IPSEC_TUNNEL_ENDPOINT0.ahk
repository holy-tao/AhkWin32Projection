#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to store address information for an end point of a tunnel mode SA.
 * @remarks
 * For the unnamed union containing the tunnel end point address, switch_type(FWP_IP_VERSION), switch_is(ipVersion).
 * 
 * <b>IPSEC_TUNNEL_ENDPOINT0</b> is a specific implementation of IPSEC_TUNNEL_ENDPOINT. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoint0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TUNNEL_ENDPOINT0 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

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
    v4Address {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    v6Address{
        get {
            if(!this.HasProp("__v6AddressProxyArray"))
                this.__v6AddressProxyArray := Win32FixedArray(this.ptr + 4, 16, Primitive, "char")
            return this.__v6AddressProxyArray
        }
    }
}
