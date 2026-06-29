#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Networking\WinSock\NL_BANDWIDTH_INFORMATION.ahk" { NL_BANDWIDTH_INFORMATION }

/**
 * Contains read-only information for the bandwidth estimates computed by the TCP/IP stack for a network connection.
 * @remarks
 * The 
 * <b>MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES</b> structure provides bandwidth estimates computed by the TCP/IP stack for a network connection. These bandwidth estimates are for the point of attachment of the host system to the underlying IP network. 
 * 
 * The <b>MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-getipnetworkconnectionbandwidthestimates">GetIpNetworkConnectionBandwidthEstimates</a> function to return bandwidth estimates obtained for the point of attachment to the IP network. It is possible to have asymmetric deployments and network conditions where the estimates observed inbound and outbound differ from each other.
 * 
 * The  <b>MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES</b>  structure is defined in the <i>Netioapi.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ns-netioapi-mib_ip_network_connection_bandwidth_estimates
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES {
    #StructPack 8

    /**
     * Bandwidth estimates for the data being received by the host from the IP network.
     */
    InboundBandwidthInformation : NL_BANDWIDTH_INFORMATION

    /**
     * Bandwidth estimates for the data being sent from the host to the IP network.
     */
    OutboundBandwidthInformation : NL_BANDWIDTH_INFORMATION

}
