#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_TRAFFIC_TYPE.ahk" { IPSEC_TRAFFIC_TYPE }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * Specifies parameters to describe IPsec traffic. (IPSEC_TRAFFIC1)
 * @remarks
 * The <b>IPSEC_TRAFFIC1</b> type describes the characteristics of the traffic that will match the SA. 
 * 
 * For IPsec transport mode, the <b>localV*Address</b> and  <b>remoteV*Address</b> members specify the IP addresses. The <b>ipsecFilterId</b> member specifies (as part of the transport layer filter conditions) the transport protocol information (such as IP protocol, ports, etc), of the matching traffic. However, if the <b>localPort</b>, <b>remotePort</b>, or <b>ipProtocol</b> member is nonzero, its value will override the corresponding value specified in the transport layer filter. 
 * 
 * For IPsec tunnel mode, the <b>localV*Address</b> and  <b>remoteV*Address</b> members specify the outer IP header tunnel endpoints. The <b>tunnelPolicyId</b> member specifies (as part of the filter conditions specified via <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmipsectunneladd1">FwpmIPsecTunnelAdd1</a>) the inner IP header addresses and transport protocol information of the matching traffic. The <b>localPort</b>, <b>remotePort</b>, and <b>ipProtocol</b> members should not be specified for tunnel mode.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_traffic1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TRAFFIC1 {
    #StructPack 8

    /**
     * An [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) value that specifies the IP version. In tunnel mode, this is the version of the outer header.
     */
    ipVersion : FWP_IP_VERSION

    localV4Address : UInt32

    remoteV4Address : UInt32

    /**
     * Type of IPsec traffic.
     * 
     * See [IPSEC_TRAFFIC_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type) for more information.
     */
    trafficType : IPSEC_TRAFFIC_TYPE

    ipsecFilterId : Int64

    /**
     * The remote TCP/UDP port for this traffic. This is used when the remote port condition in the transport
     *    layer filter is more generic than the actual remote port.
     */
    remotePort : UInt16

    /**
     * The local TCP/UDP port for this traffic. This is used when the local port condition in the transport
     *    layer filter is more generic than the actual local port.
     */
    localPort : UInt16

    /**
     * The IP protocol for this traffic. This is used when the IP protocol condition in the transport
     *    layer filter is more generic than the actual IP protocol.
     */
    ipProtocol : Int8

    /**
     * The LUID of the local interface corresponding to the local address specified above.
     */
    localIfLuid : Int64

    /**
     * The profile ID corresponding to the actual interface that the traffic is using.
     */
    realIfProfileId : UInt32

    static __New() {
        DefineProp(this.Prototype, 'localV6Address', { type: Int8[16], offset: 4 })
        DefineProp(this.Prototype, 'remoteV6Address', { type: Int8[16], offset: 20 })
        DefineProp(this.Prototype, 'tunnelPolicyId', { type: Int64, offset: 40 })
        this.DeleteProp("__New")
    }
}
