#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IP_UNIDIRECTIONAL_ADAPTER_ADDRESS structure stores the IPv4 addresses associated with a unidirectional adapter.
 * @remarks
 * The <b>IP_UNIDIRECTIONAL_ADAPTER_ADDRESS</b> structure is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getunidirectionaladapterinfo">GetUnidirectionalAdapterInfo</a> function. A unidirectional adapter is an adapter that can receive
 *     IPv4 datagrams, but can't transmit them.
 * @see https://learn.microsoft.com/windows/win32/api/ipexport/ns-ipexport-ip_unidirectional_adapter_address
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IP_UNIDIRECTIONAL_ADAPTER_ADDRESS {
    #StructPack 4

    /**
     * The number of IPv4 addresses pointed to by the <b>Address</b> member.
     */
    NumAdapters : UInt32

    /**
     * An array of variables of type <a href="https://docs.microsoft.com/windows/desktop/api/inaddr/ns-inaddr-in_addr">IPAddr</a>. Each element of the array specifies an IPv4 address associated with this unidirectional adapter.
     */
    Address : UInt32[1]

}
