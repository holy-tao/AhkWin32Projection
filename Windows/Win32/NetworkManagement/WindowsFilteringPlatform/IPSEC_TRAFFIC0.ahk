#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_TRAFFIC_TYPE.ahk" { IPSEC_TRAFFIC_TYPE }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

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
 */
export default struct IPSEC_TRAFFIC0 {
    #StructPack 8

    /**
     * Internet Protocol (IP) version. 
     * 
     * See [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) for more information.
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

    static __New() {
        DefineProp(this.Prototype, 'localV6Address', { type: Int8[16], offset: 4 })
        DefineProp(this.Prototype, 'remoteV6Address', { type: Int8[16], offset: 20 })
        DefineProp(this.Prototype, 'tunnelPolicyId', { type: Int64, offset: 40 })
        this.DeleteProp("__New")
    }
}
