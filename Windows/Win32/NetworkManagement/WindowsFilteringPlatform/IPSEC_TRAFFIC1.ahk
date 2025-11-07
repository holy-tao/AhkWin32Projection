#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies parameters to describe IPsec traffic.
 * @remarks
 * 
 * The <b>IPSEC_TRAFFIC1</b> type describes the characteristics of the traffic that will match the SA. 
 * 
 * For IPsec transport mode, the <b>localV*Address</b> and  <b>remoteV*Address</b> members specify the IP addresses. The <b>ipsecFilterId</b> member specifies (as part of the transport layer filter conditions) the transport protocol information (such as IP protocol, ports, etc), of the matching traffic. However, if the <b>localPort</b>, <b>remotePort</b>, or <b>ipProtocol</b> member is nonzero, its value will override the corresponding value specified in the transport layer filter. 
 * 
 * For IPsec tunnel mode, the <b>localV*Address</b> and  <b>remoteV*Address</b> members specify the outer IP header tunnel endpoints. The <b>tunnelPolicyId</b> member specifies (as part of the filter conditions specified via <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmipsectunneladd1">FwpmIPsecTunnelAdd1</a>) the inner IP header addresses and transport protocol information of the matching traffic. The <b>localPort</b>, <b>remotePort</b>, and <b>ipProtocol</b> members should not be specified for tunnel mode.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_traffic1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TRAFFIC1 extends Win32Struct
{
    static sizeof => 80

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
     * Type of IPsec traffic.
     * 
     * See [IPSEC_TRAFFIC_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type) for more information.
     * @type {Integer}
     */
    trafficType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ipsecFilterId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    tunnelPolicyId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The remote TCP/UDP port for this traffic. This is used when the remote port condition in the transport
     *    layer filter is more generic than the actual remote port.
     * @type {Integer}
     */
    remotePort {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * The local TCP/UDP port for this traffic. This is used when the local port condition in the transport
     *    layer filter is more generic than the actual local port.
     * @type {Integer}
     */
    localPort {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * The IP protocol for this traffic. This is used when the IP protocol condition in the transport
     *    layer filter is more generic than the actual IP protocol.
     * @type {Integer}
     */
    ipProtocol {
        get => NumGet(this, 60, "char")
        set => NumPut("char", value, this, 60)
    }

    /**
     * The LUID of the local interface corresponding to the local address specified above.
     * @type {Integer}
     */
    localIfLuid {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The profile ID corresponding to the actual interface that the traffic is using.
     * @type {Integer}
     */
    realIfProfileId {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
