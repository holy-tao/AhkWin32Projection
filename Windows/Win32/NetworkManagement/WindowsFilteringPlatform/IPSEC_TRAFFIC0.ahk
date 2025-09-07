#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies parameters to describe IPsec traffic. (IPSEC_TRAFFIC0)
 * @remarks
 * The <b>IPSEC_TRAFFIC0</b> type describes the characteristics of the traffic that will match the SA. 
  * 
  * For IPsec transport mode, the <b>localV*Address</b> and  <b>remoteV*Address</b> members specify the IP addresses. The <b>ipsecFilterId</b> member specifies (as part of the transport layer filter conditions) the transport protocol information (such as IP protocol, ports, etc), of the matching traffic. However, if the <b>remotePort</b> member is nonzero, its value will override the remote port specified in the transport layer filter. 
  * 
  * For IPsec tunnel mode, the <b>localV*Address</b> and  <b>remoteV*Address</b> members specify the outer IP header tunnel endpoints. The <b>tunnelPolicyId</b> member specifies (as part of the filter conditions specified via <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmipsectunneladd0">FwpmIPsecTunnelAdd0</a>) the inner IP header addresses, transport protocol information, of the matching traffic. The <b>remotePort</b> member should not be specified for tunnel mode.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_traffic0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TRAFFIC0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Internet Protocol (IP) version. 
     * 
     * See [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) for more information.
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
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    localV6Address{
        get {
            if(!this.HasProp("__localV6AddressProxyArray"))
                this.__localV6AddressProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__localV6AddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    remoteV4Address {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    remoteV6Address{
        get {
            if(!this.HasProp("__remoteV6AddressProxyArray"))
                this.__remoteV6AddressProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__remoteV6AddressProxyArray
        }
    }

    /**
     * Type of IPsec traffic.
     * 
     * See [IPSEC_TRAFFIC_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type) for more information.
     * @type {Integer}
     */
    trafficType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ipsecFilterId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    tunnelPolicyId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The remote TCP/UDP port for this traffic. This is used when the remote port condition in the transport
     *    layer filter is more generic than the actual remote port.
     * @type {Integer}
     */
    remotePort {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
