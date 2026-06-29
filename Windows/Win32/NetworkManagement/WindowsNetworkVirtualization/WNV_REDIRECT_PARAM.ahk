#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import ".\WNV_IP_ADDRESS.ahk" { WNV_IP_ADDRESS }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * Specifies the parameters of the event (receiving an incoming Internet Control Message Protocol redirect packet) that causes the Windows Network Virtualization (WNV) driver to generate a WnvRedirectType notification.
 * @remarks
 * Hyper-V Network Virtualization uses an Internet Control Message Protocol
 * (ICMP) redirect message to indicate a change in the virtual machine's provider address in the case of a live migration of a virtual machine.
 * 
 * For a detailed description of network virtualization concepts and terminology, refer to <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj134230(v=ws.11)">Hyper-V Network Virtualization Overview</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ns-wnvapi-wnv_redirect_param
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
export default struct WNV_REDIRECT_PARAM {
    #StructPack 4

    /**
     * Type: <b>ADDRESS_FAMILY</b>
     * 
     * The address family (<b>AF_INET</b> or <b>AF_INET6</b>) for the customer address.
     */
    CAFamily : ADDRESS_FAMILY

    /**
     * Type: <b>ADDRESS_FAMILY</b>
     * 
     * The address family (<b>AF_INET</b> or <b>AF_INET6</b>) for the original provider address.
     */
    PAFamily : ADDRESS_FAMILY

    /**
     * Type: <b>ADDRESS_FAMILY</b>
     * 
     * The address family (<b>AF_INET</b> or <b>AF_INET6</b>) for the new provider address.
     */
    NewPAFamily : ADDRESS_FAMILY

    /**
     * Type: <b>ULONG</b>
     * 
     * The identifier of a customer virtual subnet. This value ranges from 4096 (0x00001000) to 16777214 (0x00FFFFFE).
     */
    VirtualSubnetId : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_ip_address">WNV_IP_ADDRESS</a></b>
     * 
     * The IP address object for the customer address, which is the IP address configured on the virtual machine for network virtualization.
     */
    CA : WNV_IP_ADDRESS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_ip_address">WNV_IP_ADDRESS</a></b>
     * 
     * The IP address object for the provider address, which is the matching IP address used on the physical network for the customer address.
     */
    PA : WNV_IP_ADDRESS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_ip_address">WNV_IP_ADDRESS</a></b>
     * 
     * The updated provider address when a virtual machine is migrated from one host to another.
     */
    NewPA : WNV_IP_ADDRESS

}
